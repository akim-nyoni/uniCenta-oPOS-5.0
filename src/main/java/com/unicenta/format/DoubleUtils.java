/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.unicenta.format;

/**
 *
 * @author adrian
 */
public class DoubleUtils {

    /**
     *
     * @param value
     * @return
     */
    public static double fixDecimals(Number value) {
        return Math.rint((value).doubleValue() * 1000000.0) / 1000000.0;
    }
}
