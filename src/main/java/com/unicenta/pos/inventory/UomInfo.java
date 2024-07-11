package com.unicenta.pos.inventory;

import com.unicenta.basic.BasicException;
import com.unicenta.data.loader.DataRead;
import com.unicenta.data.loader.IKeyed;
import com.unicenta.data.loader.SerializerRead;

public class UomInfo implements IKeyed {

    private String m_sID;
    private String m_sName;
    
    
    
    /** Creates new CategoryInfo
     * @param id
     * @param name */
    public UomInfo(String id, String name) {
        m_sID = id;
        m_sName = name;
    }
    
    
    public void setID(String sID) {
        m_sID = sID;
    }

    public String getID() {
        return m_sID;
    }

    public String getName() {
        return m_sName;
    }

    public void setName(String sName) {
        m_sName = sName;
    }

    
    @Override
    public Object getKey() {
        return m_sID;
    }
    
    @Override
    public String toString() {
        return m_sName;
    }

    public static SerializerRead getSerializerRead() {
        return new SerializerRead() {@Override
 public Object readValues(DataRead dr) throws BasicException {
            return new UomInfo(dr.getString(1), dr.getString(2));
        }};
    }
    
    
}
