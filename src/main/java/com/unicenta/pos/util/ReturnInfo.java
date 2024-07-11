/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unicenta.pos.util;

import com.unicenta.basic.BasicException;
import com.unicenta.data.loader.DataRead;
import com.unicenta.data.loader.IKeyed;
import com.unicenta.data.loader.SerializableRead;
import com.unicenta.data.loader.SerializerRead;

/**
 *
 * @author JA - based on A Escartin Barcode
 * 15 Dec 2013
 */
public class ReturnInfo implements SerializableRead, IKeyed {

    private static final long serialVersionUID = 8906929819402L;
    private Integer idret;

    /**
     *
     */
    public ReturnInfo() {
        idret = null;
    }

    /**
     *
     * @return
     */
    @Override
    public Object getKey() {
        return idret;
    }

    /**
     *
     * @param dr
     * @throws BasicException
     */
    @Override
    public void readValues(DataRead dr) throws BasicException {
        idret = dr.getInt(1);
    }

    /**
     *
     * @param id
     */
    public void setId(Integer id) {
        idret = id;
    }

    /**
     *
     * @return
     */
    public Integer getId() {
        return idret;
    }

    /**
     *
     * @return
     */
    public static SerializerRead getSerializerRead() {
        return new SerializerRead() {
            @Override
            public Object readValues(DataRead dr) throws BasicException {
                return new ReturnInfo(
                        dr.getInt(1));
            }
        };
    }

    /**
     *
     * @param id
     */
    public ReturnInfo(Integer id) {
        this.idret = id;
    }

}
