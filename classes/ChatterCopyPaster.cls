public class ChatterCopyPaster {

    public static void GetThenSetChatter(String sourceId, String targetId) {

        Object[] strOfNewChange = new Object[3];
        FeedTrackedChange feedObj = new FeedTrackedChange();
        List <FeedItem> newPosts = new  List <FeedItem>();
        
        List <FeedItem> originalPosts = [SELECT ID, CreatedDate, CreatedById, CreatedBy.FirstName, CreatedBy.LastName, ParentId, Parent.Name, Body,
                                        (SELECT ID, FieldName, OldValue, NewValue FROM FeedTrackedChanges )
                                        FROM FeedItem
                                        WHERE ParentId=:sourceId];

        For (Integer loopVar=0; loopVar < originalPosts.size(); loopVar++) {
            if( originalPosts[loopVar].FeedTrackedChanges.size() > 0 ) {
                feedObj = originalPosts[loopVar].FeedTrackedChanges;
                strOfNewChange[0] = feedObj.FieldName;
                strOfNewChange[1] = feedObj.OldValue;
                strOfNewChange[2] = feedObj.NewValue;
                newPosts.add( new FeedItem( Body = String.ValueOf(strOfNewChange[0]).remove('.')+' Changed FROM: '+strOfNewChange[1]+'\r\n TO: '+strOfNewChange[2],
                                            ParentId = targetId) );
            }
        }

        insert newPosts;
    }
}