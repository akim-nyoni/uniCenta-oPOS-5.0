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

package com.unicenta.pos.forms;

import com.unicenta.data.loader.LocalRes;
import com.unicenta.pos.ticket.UserInfo;
import com.unicenta.pos.util.Hashcypher;
import lombok.extern.slf4j.Slf4j;
import org.xml.sax.Attributes;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import javax.swing.*;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import java.io.IOException;
import java.io.StringReader;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

/**
 * @author adrianromero
 */
@Slf4j
public class AppUser {

  private static SAXParser m_sp = null;
  private static HashMap<String, String> m_oldclasses; // This is for backwards compatibility purposes

  private final String m_sId;
  private final String m_sName;
  private final String m_sCard;
  private String m_sPassword;
  private final String m_sRole;
  private final Icon m_Icon;

  private Set<String> m_apermissions;

  static {
    initOldClasses();
  }

  /**
   * Creates a new instance of AppUser
   *
   * @param id
   * @param name
   * @param card
   * @param password
   * @param icon
   * @param role
   */
  public AppUser(String id, String name, String password, String card, String role, Icon icon) {
    m_sId = id;
    m_sName = name;
    m_sPassword = password;
    m_sCard = card;
    m_sRole = role;
    m_Icon = icon;
    m_apermissions = null;
  }

  /**
   * Gets the User's button icon
   */
  public Icon getIcon() {
    return m_Icon;
  }

  /**
   * Get the user's ID
   */
  public String getId() {
    return m_sId;
  }

  /**
   * Get the User's Name
   */
  public String getName() {
    return m_sName;
  }

  /**
   * Set the User's Password
   */
  public void setPassword(String sValue) {
    m_sPassword = sValue;
  }

  /**
   * Get the User's Password
   */
  public String getPassword() {
    return m_sPassword;
  }

  /**
   * Get the User's Role
   */
  public String getRole() {
    return m_sRole;
  }

  /**
   * Get the User's Card
   */
  public String getCard() {
    return m_sCard;
  }

  /**
   * Validate User's Password
   *
   * @return
   */
  public boolean authenticate() {
    return m_sPassword == null || m_sPassword.equals("") || m_sPassword.startsWith("empty:");
  }

  /**
   * Eval User's Password
   *
   * @param sPwd
   * @return
   */
  public boolean authenticate(String sPwd) {
    return Hashcypher.authenticate(sPwd, m_sPassword);
  }

  /**
   * Load User's Permissions
   *
   * @param dlSystem
   */
  public void fillPermissions(DataLogicSystem dlSystem) {

    // JG 16 May use diamond inference
    m_apermissions = new HashSet<>();
    // Y lo que todos tienen permisos
    m_apermissions.add("com.unicenta.pos.forms.JPanelMenu");
    m_apermissions.add("Menu.Exit");

    String sRolePermisions = dlSystem.findRolePermissions(m_sRole);

    if (sRolePermisions != null) {
      try {
        if (m_sp == null) {
          SAXParserFactory spf = SAXParserFactory.newInstance();
          m_sp = spf.newSAXParser();
        }
        m_sp.parse(new InputSource(new StringReader(sRolePermisions)), new ConfigurationHandler());

      } catch (ParserConfigurationException ePC) {
        log.error(LocalRes.getIntString("exception.parserconfig"), ePC);
      } catch (SAXException eSAX) {
        log.error(LocalRes.getIntString("exception.xmlfile"), eSAX);
      } catch (IOException eIO) {
        log.error(LocalRes.getIntString("exception.iofile"), eIO);
      }
    }

  }

  /**
   * Validate User's Permissions
   *
   * @param classname
   * @return
   */
  public boolean hasPermission(String classname) {

    return (m_apermissions == null) ? false : m_apermissions.contains(classname);
  }

  /**
   * Get User's ID/Name
   *
   * @return
   */
  public UserInfo getUserInfo() {
    return new UserInfo(m_sId, m_sName);
  }

  private static String mapNewClass(String classname) {
    String newclass = m_oldclasses.get(classname);
    return newclass == null
            ? classname
            : newclass;
  }

  private static void initOldClasses() {
    // JG 16 May use diamond inference
    m_oldclasses = new HashMap<>();

    // update permissions from 0.0.24 to 2.20
    m_oldclasses.put("net.adrianromero.tpv.panelsales.JPanelTicketSales", "com.unicenta.pos.sales.JPanelTicketSales");
    m_oldclasses.put("net.adrianromero.tpv.panelsales.JPanelTicketEdits", "com.unicenta.pos.sales.JPanelTicketEdits");
    m_oldclasses.put("net.adrianromero.tpv.panels.JPanelPayments", "com.unicenta.pos.panels.JPanelPayments");
    m_oldclasses.put("net.adrianromero.tpv.panels.JPanelCloseMoney", "com.unicenta.pos.panels.JPanelCloseMoney");
    m_oldclasses.put("net.adrianromero.tpv.reports.JReportClosedPos", "/com/unicenta/reports/closedpos.bs");

    m_oldclasses.put("Menu.StockManagement", "com.unicenta.pos.forms.MenuStockManagement");
    m_oldclasses.put("net.adrianromero.tpv.inventory.ProductsPanel", "com.unicenta.pos.inventory.ProductsPanel");
    m_oldclasses.put("net.adrianromero.tpv.inventory.ProductsWarehousePanel", "com.unicenta.pos.inventory.ProductsWarehousePanel");
    m_oldclasses.put("net.adrianromero.tpv.inventory.CategoriesPanel", "com.unicenta.pos.inventory.CategoriesPanel");
    m_oldclasses.put("net.adrianromero.tpv.panels.JPanelTax", "com.unicenta.pos.inventory.TaxPanel");
    m_oldclasses.put("net.adrianromero.tpv.inventory.StockDiaryPanel", "com.unicenta.pos.inventory.StockDiaryPanel");
    m_oldclasses.put("net.adrianromero.tpv.inventory.StockManagement", "com.unicenta.pos.inventory.StockManagement");
    m_oldclasses.put("net.adrianromero.tpv.reports.JReportProducts", "/com/unicenta/reports/products.bs");
    m_oldclasses.put("net.adrianromero.tpv.reports.JReportCatalog", "/com/unicenta/reports/productscatalog.bs");
    m_oldclasses.put("net.adrianromero.tpv.reports.JReportInventory", "/com/unicenta/reports/inventory.bs");
    m_oldclasses.put("net.adrianromero.tpv.reports.JReportInventory2", "/com/unicenta/reports/inventoryb.bs");
    m_oldclasses.put("net.adrianromero.tpv.reports.JReportInventoryBroken", "/com/unicenta/reports/inventorybroken.bs");
    m_oldclasses.put("net.adrianromero.tpv.reports.JReportInventoryDiff", "/com/unicenta/reports/inventorydiff.bs");

    m_oldclasses.put("Menu.SalesManagement", "com.unicenta.pos.forms.MenuSalesManagement");
    m_oldclasses.put("net.adrianromero.tpv.reports.JReportUserSales", "/com/unicenta/reports/usersales.bs");
    m_oldclasses.put("net.adrianromero.tpv.reports.JReportClosedProducts", "/com/unicenta/reports/closedproducts.bs");
    m_oldclasses.put("net.adrianromero.tpv.reports.JReportTaxes", "/com/unicenta/reports/taxes.bs");
    m_oldclasses.put("net.adrianromero.tpv.reports.JChartSales", "/com/unicenta/reports/chartsales.bs");

    m_oldclasses.put("Menu.Maintenance", "com.unicenta.pos.forms.MenuMaintenance");
    m_oldclasses.put("net.adrianromero.tpv.admin.PeoplePanel", "com.unicenta.pos.admin.PeoplePanel");
    m_oldclasses.put("net.adrianromero.tpv.admin.RolesPanel", "com.unicenta.pos.admin.RolesPanel");
    m_oldclasses.put("net.adrianromero.tpv.admin.ResourcesPanel", "com.unicenta.pos.admin.ResourcesPanel");
    m_oldclasses.put("net.adrianromero.tpv.inventory.LocationsPanel", "com.unicenta.pos.inventory.LocationsPanel");
    m_oldclasses.put("net.adrianromero.tpv.mant.JPanelFloors", "com.unicenta.pos.mant.JPanelFloors");
    m_oldclasses.put("net.adrianromero.tpv.mant.JPanelPlaces", "com.unicenta.pos.mant.JPanelPlaces");
    m_oldclasses.put("com.unicenta.possync.ProductsSync", "com.unicenta.possync.ProductsSyncCreate");
    m_oldclasses.put("com.unicenta.possync.OrdersSync", "com.unicenta.possync.OrdersSyncCreate");

    m_oldclasses.put("Menu.ChangePassword", "Menu.ChangePassword");
    m_oldclasses.put("net.adrianromero.tpv.panels.JPanelPrinter", "com.unicenta.pos.panels.JPanelPrinter");
    m_oldclasses.put("net.adrianromero.tpv.config.JPanelConfiguration", "com.unicenta.pos.config.JPanelConfiguration");

    // update permissions from 2.00 to 2.20
    m_oldclasses.put("com.unicenta.pos.reports.JReportCustomers", "/com/unicenta/reports/customers.bs");
    m_oldclasses.put("com.unicenta.pos.reports.JReportCustomersB", "/com/unicenta/reports/customersb.bs");
    m_oldclasses.put("com.unicenta.pos.reports.JReportClosedPos", "/com/unicenta/reports/closedpos.bs");
    m_oldclasses.put("com.unicenta.pos.reports.JReportClosedProducts", "/com/unicenta/reports/closedproducts.bs");
    m_oldclasses.put("com.unicenta.pos.reports.JChartSales", "/com/unicenta/reports/chartsales.bs");
    m_oldclasses.put("com.unicenta.pos.reports.JReportInventory", "/com/unicenta/reports/inventory.bs");
    m_oldclasses.put("com.unicenta.pos.reports.JReportInventory2", "/com/unicenta/reports/inventoryb.bs");
    m_oldclasses.put("com.unicenta.pos.reports.JReportInventoryBroken", "/com/unicenta/reports/inventorybroken.bs");
    m_oldclasses.put("com.unicenta.pos.reports.JReportInventoryDiff", "/com/unicenta/reports/inventorydiff.bs");
    m_oldclasses.put("com.unicenta.pos.reports.JReportPeople", "/com/unicenta/reports/people.bs");
    m_oldclasses.put("com.unicenta.pos.reports.JReportTaxes", "/com/unicenta/reports/taxes.bs");
    m_oldclasses.put("com.unicenta.pos.reports.JReportUserSales", "/com/unicenta/reports/usersales.bs");
    m_oldclasses.put("com.unicenta.pos.reports.JReportProducts", "/com/unicenta/reports/products.bs");
    m_oldclasses.put("com.unicenta.pos.reports.JReportCatalog", "/com/unicenta/reports/productscatalog.bs");

    // update permissions from 2.10 to 2.20
    m_oldclasses.put("com.unicenta.pos.panels.JPanelTax", "com.unicenta.pos.inventory.TaxPanel");

  }

  private class ConfigurationHandler extends DefaultHandler {
    @Override
    public void startDocument() throws SAXException {
    }

    @Override
    public void endDocument() throws SAXException {
    }

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
      if ("class".equals(qName)) {
        m_apermissions.add(mapNewClass(attributes.getValue("name")));
      }
    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
    }
  }


}
