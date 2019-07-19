public class ChatterCopyPaster {

    public static void GetThenSetChatter(String sourceId, String targetId) {
        List <FeedItem> newPosts = new  List <FeedItem>();
        List <FeedItem> originalPosts = [SELECT ID, CreatedDate, CreatedById, CreatedBy.FirstName, CreatedBy.LastName, ParentId, Parent.Name, Body
                                        //(SELECT ID, FieldName, OldValue, NewValue FROM FeedTrackedChanges ORDER BY ID DESC)
                                        FROM FeedItem
                                        WHERE ParentId=:sourceId AND IsRichText=:true
                                        ORDER BY CreatedDate DESC];

        System.debug('Original Posts: '+ originalPosts);
        For (Integer loopVar=0; loopVar < originalPosts.size(); loopVar++) {
            newPosts.add( new FeedItem( Body = originalPosts[loopVar].Body, ParentId = targetId) );
        }

        System.debug('New Posts: '+ newPosts);
        //insert newPosts;
    }
}