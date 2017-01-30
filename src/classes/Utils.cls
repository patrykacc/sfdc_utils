/**
 * Created by p.organa on 1/30/2017.
 *
 */

public with sharing class Utils {

    /**
     * @description Method to insert objects to DataBase with improved audit
     * @param sObjects - sObjects to be insert
     * @param field - field that identifies Saveresult with inserted object
     * @return map where key is a value from field specified as param: field
     * and the value is Save result for sObject which is identified by key
     */
    public static Map<String,Database.SaveResult> improvedInsert(List<SObject> sObjects, Schema.sObjectField field) {
        Map<String,Database.SaveResult> saveResultByField = new Map<String,Database.SaveResult>();
        List<Database.SaveResult> results = Database.insert(sObjects, false);
        for (Integer i = 0;i<sObjects.size();i++) {
            saveResultByField.put((String)sObjects.get(i).get(field),results.get(i));
        }
        return  saveResultByField;
    }

    /**
     * @description Method to update objects in DataBase with improved audit
     * @param sObjects - sObjects to be update
     * @param field - field that identifies Saveresult with inserted object
     * @return map where key is a value from field specified as param: field
     * and the value is Save result for sObject which is identified by key
     */
    public static Map<String,Database.SaveResult> improvedUpdate(List<SObject> sObjects, Schema.sObjectField field) {
        Map<String,Database.SaveResult> saveResultByField = new Map<String,Database.SaveResult>();
        List<Database.SaveResult> results = Database.update(sObjects, false);
        for (Integer i = 0;i<sObjects.size();i++) {
            saveResultByField.put((String)sObjects.get(i).get(field),results.get(i));
        }
        return saveResultByField;
    }
    /**
     * @description Method to upsert objects in DataBase with improved audit
     * @param sObjects - sObjects to be upsert
     * @param field - field that identifies Upsertresult with inserted object
     * @return map where key is a value from field specified as param: field
     * and the value is Upsert result for sObject which is identified by key
     */
    public static Map<String,Database.UpsertResult> improvedUpsert(List<SObject> sObjects, Schema.sObjectField field) {
        Map<String,Database.UpsertResult> saveResultByField = new Map<String,Database.UpsertResult>();
        List<Database.UpsertResult> results = Database.upsert(sObjects, false);
        for (Integer i = 0;i<sObjects.size();i++) {
            saveResultByField.put((String)sObjects.get(i).get(field),results.get(i));
        }
        return saveResultByField;
    }

}