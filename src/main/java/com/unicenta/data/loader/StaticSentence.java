//    uniCenta oPOS  - Touch Friendly Point Of Sale
//    Copyright (c) 2009-2018 uniCenta & previous Openbravo POS works
//    https://unicenta.com
//
//    This file is part of uniCenta oPOS
//
//    uniCenta oPOS is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//   uniCenta oPOS is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with uniCenta oPOS.  If not, see <http://www.gnu.org/licenses/>.

package com.unicenta.data.loader;

import com.unicenta.basic.BasicException;
import lombok.extern.slf4j.Slf4j;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author adrianromero
 */
@Slf4j
public class StaticSentence extends JDBCSentence {


    private ISQLBuilderStatic iSQLBuilder;

    /**
     *
     */
    protected SerializerWrite m_SerWrite = null;

    /**
     *
     */
    protected SerializerRead m_SerRead = null;

    // Estado
    private Statement statement;

    /**
     * Creates a new instance of StaticSentence
     *
     * @param s
     * @param sentence
     * @param serread
     * @param serwrite
     */
    public StaticSentence(Session s, ISQLBuilderStatic sentence, SerializerWrite serwrite, SerializerRead serread) {
        super(s);
        iSQLBuilder = sentence;
        m_SerWrite = serwrite;
        m_SerRead = serread;
        statement = null;
    }

    /**
     * Creates a new instance of StaticSentence
     *
     * @param s
     * @param sentence
     */
    public StaticSentence(Session s, ISQLBuilderStatic sentence) {
        this(s, sentence, null, null);
    }

    /**
     * Creates a new instance of StaticSentence
     *
     * @param s
     * @param sentence
     * @param serwrite
     */
    public StaticSentence(Session s, ISQLBuilderStatic sentence, SerializerWrite serwrite) {
        this(s, sentence, serwrite, null);
    }

    /**
     * Creates a new instance of StaticSentence
     *
     * @param s
     * @param sentence
     * @param serread
     * @param serwrite
     */
    public StaticSentence(Session s, String sentence, SerializerWrite serwrite, SerializerRead serread) {
        this(s, new NormalBuilder(sentence), serwrite, serread);
    }

    /**
     * Creates a new instance of StaticSentence
     *
     * @param s
     * @param sentence
     * @param serwrite
     */
    public StaticSentence(Session s, String sentence, SerializerWrite serwrite) {
        this(s, new NormalBuilder(sentence), serwrite, null);
    }

    /**
     * Creates a new instance of StaticSentence
     *
     * @param s
     * @param sentence
     */
    public StaticSentence(Session s, String sentence) {
        this(s, new NormalBuilder(sentence), null, null);
    }

    public String fixSqliteDate(String sql) {

        try {
            if (session.getURL().contains("sqlite") && sql.contains("{ts '")) {
                StringBuilder sqliteSQL = new StringBuilder();

                Pattern date = Pattern.compile("(?<=ts ).*(?=})");
                Matcher matchPattern = date.matcher(sql);

                if (matchPattern.find()) {
                    sqliteSQL.append(sql.replaceAll("\\{.*}", matchPattern.group(0)));
                }

                return sqliteSQL.toString();
            }

        }
        catch (Exception e) {
            log.error("Error fixing sql for sqlite {}", e.getMessage());
            return sql;
        }
        return sql;
    }
    /**
     * @param params
     * @return
     * @throws BasicException
     */
    @Override
    public DataResultSet openExec(Object params) throws BasicException {
        // true -> un resultset
        // false -> un updatecount (si -1 entonces se acabo)

        closeExec();

        try {

            String sentence = fixSqliteDate(iSQLBuilder.getSQL(m_SerWrite, params));
            //String sentence = iSQLBuilder.getSQL(m_SerWrite, params);

            statement = session.getConnection().createStatement();

            log.debug("Executing static SQL: {}", sentence);

            if (statement.execute(sentence)) {
                return new JDBCDataResultSet(statement.getResultSet(), m_SerRead);
            } else {
                int iUC = statement.getUpdateCount();
                if (iUC < 0) {
                    return null;
                } else {
                    return new SentenceUpdateResultSet(iUC);
                }
            }
        } catch (SQLException eSQL) {
            throw new BasicException(eSQL);
        }
    }

    /**
     * @throws BasicException
     */
    @Override
    public void closeExec() throws BasicException {

        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException eSQL) {
                throw new BasicException(eSQL);
            } finally {
                statement = null;
            }
        }
    }

    /**
     * @return
     * @throws BasicException
     */
    @Override
    public DataResultSet moreResults() throws BasicException {

        try {
            if (statement.getMoreResults()) {
                // tenemos resultset
                return new JDBCDataResultSet(statement.getResultSet(), m_SerRead);
            } else {
                // tenemos updatecount o si devuelve -1 ya no hay mas
                int iUC = statement.getUpdateCount();
                if (iUC < 0) {
                    return null;
                } else {
                    return new SentenceUpdateResultSet(iUC);
                }
            }
        } catch (SQLException eSQL) {
            throw new BasicException(eSQL);
        }
    }

}
