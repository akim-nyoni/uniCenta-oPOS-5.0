

package com.unicenta.pos.voucher;

import com.unicenta.data.loader.Datas;
import com.unicenta.data.model.*;
import com.unicenta.data.user.EditorRecord;
import com.unicenta.format.Formats;
import com.unicenta.pos.forms.AppLocal;
import com.unicenta.pos.panels.JPanelTable2;

public class VoucherPanel extends JPanelTable2 {

    private VoucherEditor editor;    

    @Override
    protected void init() {  
        row = new Row(
                new Field("ID", Datas.STRING, Formats.STRING),
                new Field(AppLocal.getIntString("label.Number"), Datas.STRING, Formats.STRING, true, true, true),
                new Field(AppLocal.getIntString("label.customer"), Datas.STRING, Formats.STRING),
                new Field(AppLocal.getIntString("label.paymenttotal"), Datas.DOUBLE, Formats.DOUBLE),
                new Field(AppLocal.getIntString("label.status"), Datas.STRING, Formats.STRING)
                
        );        
        Table table = new Table(
                "vouchers",
                new PrimaryKey("ID"),
                new Column("VOUCHER_NUMBER"),
                new Column("CUSTOMER"),
                new Column("AMOUNT"),
                new Column("STATUS"));
        lpr = row.getListProvider(app.getSession(), table);
        spr = row.getSaveProvider(app.getSession(), table);              
        
        editor = new VoucherEditor(dirty,app);
    }

   
    @Override
    public EditorRecord getEditor() {
        return editor;
    }  
    
    @Override
    public String getTitle() {
        return AppLocal.getIntString("Menu.Vouchers");
    } 
}
