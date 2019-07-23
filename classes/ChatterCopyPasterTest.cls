@isTest
public class ChatterCopyPasterTest {

    @isTest
    static void ChekGetThenSetChatter() {

        String sourceId = '0012v00002OqrVIAAZ';
        String targetId = '0062v00001DvRFjAAN';
        List <FeedTrackedChange> allChanges = new List <FeedTrackedChange>();
        Integer counterOfChanges = 0;

        ChatterCopyPaster.GetThenSetChatter(sourceId,targetId);

        List <FeedItem> originalPosts = [SELECT ID, ParentId, Body,
                                        (SELECT ID, FieldName, OldValue, NewValue FROM FeedTrackedChanges )
                                        FROM FeedItem
                                        WHERE ParentId =: sourceId];

        List <FeedItem> newPosts = [SELECT ID,  ParentId, Body
                                    FROM FeedItem
                                    WHERE ParentId=:targetId];

        for ( Integer loopVar; loopVar < originalPosts.size(); loopVar++ ) {
            if( originalPosts[loopVar].FeedTrackedChanges.size() > 0 ) {
                allChanges.add(originalPosts[loopVar].FeedTrackedChanges);

                for ( FeedItem lpVar: newPosts ) {
                    if( lpVar.Body == allChanges[loopVar].NewValue ) {
                        counterOfChanges++;
                    }
                }
            }
        }

        System.assertEquals(allChanges.size(),counterOfChanges);
    }
}