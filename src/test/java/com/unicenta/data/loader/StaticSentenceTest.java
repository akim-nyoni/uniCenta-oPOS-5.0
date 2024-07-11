package com.unicenta.data.loader;

import com.unicenta.plugins.Application;
import com.unicenta.plugins.metrics.Metrics;
import com.unicenta.pos.forms.AppLocal;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;


public class StaticSentenceTest {

    final static String UPDATE_SQL = "UPDATE closedcash SET DATEEND = {ts '2022-01-20 14:18:09.840'}, NOSALES = 0 WHERE HOST = 'store1' AND MONEY = '932cdfea-1822-4d07-9dc8-a788adeabfec'";
    final static String JOIN_SQL = "SELECT T.TICKETID, T.TICKETTYPE, R.DATENEW, P.NAME, C.NAME, SUM(PM.TOTAL), T.STATUS, PM.notes FROM receipts R JOIN tickets T ON R.ID = T.ID LEFT OUTER JOIN payments PM ON R.ID = PM.RECEIPT LEFT OUTER JOIN customers C ON C.ID = T.CUSTOMER LEFT OUTER JOIN people P ON T.PERSON = P.ID WHERE (T.TICKETTYPE = 0 AND R.DATENEW >= R JOIN tickets T ON R.ID = T.ID LEFT OUTER JOIN payments PM ON R.ID = PM.RECEIPT LEFT OUTER JOIN customers C ON C.ID = T.CUSTOMER LEFT OUTER JOIN people P ON T.PERSON = P.ID WHERE (T.TICKETTYPE = 0 AND R.DATENEW >= {ts '2023-02-12 00:00:00.000') GROUP BY T.ID, T.TICKETID, T.TICKETTYPE, R.DATENEW, P.NAME, C.NAME, PM.notes ORDER BY R.DATENEW DESC, T.TICKETID";
    Session session;

    @Before
    public void setup() throws Exception {
        session = Mockito.mock(Session.class);
    }

    @Test
    public void shouldConvertUpdateToSQLite() throws Exception {
        Mockito.when(session.getURL()).thenReturn("jdbc:sqlite://home/temp/.unicenta/unicentaopos");
        StaticSentence staticSentence = new StaticSentence(session, "");
        String fixSqliteDate = staticSentence.fixSqliteDate(UPDATE_SQL);
        assert !fixSqliteDate.contains("{");
        assert fixSqliteDate.contains("UPDATE");
    }

    @Test
    public void shouldConvertJoinToSQLite() throws Exception {
        Mockito.when(session.getURL()).thenReturn("jdbc:sqlite://home/temp/.unicenta/unicentaopos");
        StaticSentence staticSentence = new StaticSentence(session, "");
        String fixSqliteDate = staticSentence.fixSqliteDate(JOIN_SQL);
        assert !fixSqliteDate.contains("{");
    }

}