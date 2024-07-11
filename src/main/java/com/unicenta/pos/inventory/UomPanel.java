package com.unicenta.pos.inventory;

import com.unicenta.data.gui.ListCellRendererBasic;
import com.unicenta.data.loader.ComparatorCreator;
import com.unicenta.data.loader.TableDefinition;
import com.unicenta.data.loader.Vectorer;
import com.unicenta.data.user.EditorRecord;
import com.unicenta.data.user.ListProvider;
import com.unicenta.data.user.ListProviderCreator;
import com.unicenta.data.user.SaveProvider;
import com.unicenta.pos.forms.AppLocal;
import com.unicenta.pos.forms.DataLogicSales;
import com.unicenta.pos.panels.JPanelTable;
import javax.swing.ListCellRenderer;

public class UomPanel extends JPanelTable {

     private TableDefinition tuom;
     private UomEditor jeditor;
     
    @Override
    protected void init() {
        DataLogicSales dlSales = (DataLogicSales) app.getBean("com.unicenta.pos.forms.DataLogicSales");
        tuom = dlSales.getTableUom();
        jeditor = new UomEditor(app, dirty);   
    }

    @Override
    public EditorRecord getEditor() {
        return jeditor;
    }

    @Override
    public ListProvider getListProvider() {
         return new ListProviderCreator(tuom);
    }

    @Override
    public SaveProvider getSaveProvider() {
        return new SaveProvider(tuom);  
    }
    
    @Override
    public Vectorer getVectorer() {
        return tuom.getVectorerBasic(new int[]{1});
    }
    

     @Override
    public ListCellRenderer getListCellRenderer() {
        return new ListCellRendererBasic(tuom.getRenderStringBasic(new int[]{1}));
    }
     
    @Override
    public String getTitle() {
        return AppLocal.getIntString("Menu.Uom");
    }
    
}
