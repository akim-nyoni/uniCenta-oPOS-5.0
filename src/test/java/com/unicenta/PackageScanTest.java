package com.unicenta;

import com.unicenta.pos.util.FlatLookAndFeel;
import org.junit.Assert;
import org.junit.Test;

public class PackageScanTest {

    @Test
    public void shouldScanPackage() {
        Assert.assertEquals(67, new FlatLookAndFeel().getLafs().size());
    }
}
