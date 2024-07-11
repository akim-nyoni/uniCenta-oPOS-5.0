/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unicenta.pos.suppliers;

import com.unicenta.basic.BasicException;
import java.awt.Component;
import java.awt.event.ActionListener;

/**
 *
 * @author JG uniCenta - outline/prep for uniCenta mobile + eCommerce connector
 */
public interface SupplierTicketSelector {

    /**
     *
     * @throws BasicException
     */
    public void loadSupplierss() throws BasicException;

    /**
     *
     * @param value
     */
    public void setComponentEnabled(boolean value);

    /**
     *
     * @return
     */
    public Component getComponent();

    /**
     *
     * @param l
     */
    public void addActionListener(ActionListener l);

    /**
     *
     * @param l
     */
    public void removeActionListener(ActionListener l);
}