package com.unicenta.data.loader;

/**
 *
 * @author adrianromero
 */
public class SessionDBSQLite implements SessionDB {

    /**
     *
     * @return
     */
    public String TRUE() {
        return "1";
    }

    /**
     *
     * @return
     */
    public String FALSE() {
        return "0";
    }

    /**
     *
     * @return
     */
    public String INTEGER_NULL() {
        return "CAST(NULL AS UNSIGNED INTEGER)";
    }

    /**
     *
     * @return
     */
    public String CHAR_NULL() {
        return "CAST(NULL AS CHAR)";
    }

    /**
     *
     * @return
     */
    public String getName() {
        return "SQLite";
    }

    /**
     *
     * @param s
     * @param sequence
     * @return
     */
    @Override
    public SentenceFind getSequenceSentence(Session s, String sequence) {
        return new SequenceForSQLite(s, sequence);
    }
   
    /**
     *
     * @param s
     * @param sequence
     * @return
     */
    @Override
    public SentenceFind resetSequenceSentence(Session s, String sequence) {
        return new SequenceForSQLite(s, "UPDATE pickup_number SET ID=1");
    }    
}
