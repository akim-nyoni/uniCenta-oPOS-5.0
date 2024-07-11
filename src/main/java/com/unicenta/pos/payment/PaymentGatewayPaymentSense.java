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

package com.unicenta.pos.payment;

import com.unicenta.plugins.Application;
import com.unicenta.plugins.common.AppContext;
import com.unicenta.pos.util.RoundUtils;
import lombok.extern.slf4j.Slf4j;

import javax.swing.*;
import java.awt.*;

@Slf4j
public class PaymentGatewayPaymentSense implements PaymentGateway {

    /** Creates a new instance of PaymentGatewayExt */
    public PaymentGatewayPaymentSense() {
    }

    Window getPaymentWindow() {
        for (Window window : Window.getWindows()) {
            if (window.isActive()) {
                return window;
            }
        }
        return null;
    }

    /**
     *
     * @param payinfo
     */
    @Override
    public void execute(PaymentInfoMagcard payinfo) {

        int timer = 0;
        int timeout = 180;

        new Application().paymentSenseTransaction(RoundUtils.round(payinfo.getTotal()), getPaymentWindow());

        while (AppContext.getIsProcessing() == null || AppContext.getIsProcessing()) {
            try {
                log.info("uniCenta-oPos: waiting for payment to complete ....");
                Thread.sleep(1000);
                timer += 1;
                if (timer > timeout) break;
            } catch (InterruptedException e) {
                log.error(e.getMessage());
            }
        }

        if (AppContext.getPaymentResult() == null) {
            payinfo.paymentError("Transaction Error! Please try again", "No Response");
        }
        if (AppContext.getPaymentResult().getTransactionResult().equals("SUCCESSFUL")){
            payinfo.setCardName(AppContext.getPaymentResult().getCardSchemeName());
            payinfo.setVerification(AppContext.getPaymentResult().getPaymentMethod());
            payinfo.setChipAndPin(true);
            payinfo.paymentOK(
                    AppContext.getPaymentResult().getAuthCode(),
                    AppContext.getPaymentResult().getTransactionId(),
                    AppContext.getPaymentResult().getTransactionResult()
            );
        }
        else {
            payinfo.paymentError("Transaction Error! Please try again", AppContext.getPaymentResult().getTransactionResult());
        }
    }
}
