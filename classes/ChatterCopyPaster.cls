public class ChatterCopyPaster {

    public static void GetThenSetChatter(String sourceId, String targetId) {

        FeedTrackedChange feedObj = new FeedTrackedChange();
        List <FeedItem> newPosts = new  List <FeedItem>();

        List <FeedItem> originalPosts = [SELECT ID, ParentId, Body,
                                        (SELECT ID, FieldName, OldValue, NewValue FROM FeedTrackedChanges )
                                        FROM FeedItem
                                        WHERE ParentId=:sourceId];

        for (FeedItem loopVar: originalPosts) {
            if( loopVar.FeedTrackedChanges.size() != 0 ) {
                feedObj = loopVar.FeedTrackedChanges;
                newPosts.add( new FeedItem( Body = 'Value changed TO: '+feedObj.NewValue,
                                            ParentId = targetId) );
            }
        }

        insert newPosts;
    }
}