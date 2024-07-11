package com.unicenta.data.loader;

import com.unicenta.basic.BasicException;

public class SequenceForSQLite extends BaseSentence {

    private BaseSentence sent1;
    private BaseSentence sent2;

    /** Creates a new instance of SequenceForMySQL
     * @param s
     * @param sSeqTable */
    public SequenceForSQLite(Session s, String sSeqTable) {

        sent1 = new StaticSentence(s, "UPDATE " + sSeqTable + " SET ID = last_insert_rowid()+1");
        sent2 = new StaticSentence(s, "SELECT last_insert_rowid()", null, SerializerReadInteger.INSTANCE);
    }

    // Funciones de bajo nivel

    /**
     *
     * @param params
     * @return
     * @throws BasicException
     */
    public DataResultSet openExec(Object params) throws BasicException {
        sent1.exec();
        return sent2.openExec(null);
    }

    /**
     *
     * @return
     * @throws BasicException
     */
    public DataResultSet moreResults() throws BasicException {
        return sent2.moreResults();
    }

    /**
     *
     * @throws BasicException
     */
    public void closeExec() throws BasicException {
        sent2.closeExec();
    }
}
