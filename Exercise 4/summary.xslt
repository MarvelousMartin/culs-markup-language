<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text" encoding="UTF-8" omit-xml-declaration="yes" indent="no" media-type="application/json"/>
<xsl:template match="root">
{
    "portfolio": [
        {
            "akcie": [
                <xsl:for-each select="portfolio/cennePapiry/akcie">
                    <xsl:choose>
                        <!-- Syntax checker -->
                        <xsl:when test="position() != last()">
                        {
                            "nazev": "<xsl:value-of select="nazev"/>",
                            "cena": <xsl:value-of select="cena"/>,
                            "mena": "<xsl:value-of select="cena/@mena"/>",
                            "akcionari": [
                            <xsl:for-each select="akcionari">
                                {
                                "vlastnik": "<xsl:value-of select="pocetAkcii/@vlastnik"/>",
                                "pocetAkcii": <xsl:value-of select="pocetAkcii"/>
                                }
                            </xsl:for-each>
                            ]
                        },
                        </xsl:when>
                        <xsl:otherwise>
                        {
                            "nazev": "<xsl:value-of select="nazev"/>",
                            "cena": <xsl:value-of select="cena"/>,
                            "mena": "<xsl:value-of select="cena/@mena"/>",
                            "akcionari": [
                            <xsl:for-each select="akcionari">
                                {
                                "vlastnik": "<xsl:value-of select="pocetAkcii/@vlastnik"/>",
                                "pocetAkcii": <xsl:value-of select="pocetAkcii"/>
                                }
                            </xsl:for-each>
                            ]
                        }
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            ]
        },
        {
            "krypto":[
                <xsl:for-each select="portfolio/krypto/kryptomena">
                    {
                    "nazev": "<xsl:value-of select="nazev"/>",
                    "zkratka": "<xsl:value-of select="zkratka"/>",
                    "vObehuOd": <xsl:value-of select="vObehuOd"/>,
                    "zalozil": "<xsl:value-of select="zalozil"/>",
                    "pocetMinci": "<xsl:value-of select="pocetMinci"/>", <!-- Some crypto have "inf" amount of coins -->
                    "cena": <xsl:value-of select="cena"/>,
                    "pristiHalving": "<xsl:value-of select="halvingNext"/>" <!-- There can be no next halving → "NaN" -->
                    }<xsl:if test="position() != last()">,</xsl:if>
                </xsl:for-each>
            ]
        },
        {
            "tokeny":[
                <xsl:for-each select="portfolio/tokeny/token">
                    {
                    "nazev": "<xsl:value-of select="nazev"/>",
                    "cena": <xsl:value-of select="koupe"/>,
                    "mena": "<xsl:value-of select="koupe/@mena"/>",
                    "vlastnosti": [
                    <xsl:for-each select="vlastnosti/vlastnost">
                        <xsl:choose>
                            <!-- Syntax checker -->
                            <xsl:when test="position() != last()">
                                {
                                "vlastnost": "<xsl:value-of select="@nazev"/>",
                                "pocetDalsichNFT": <xsl:value-of select="pocet"/>
                                },
                            </xsl:when>
                            <xsl:otherwise>
                                {
                                "vlastnost": "<xsl:value-of select="@nazev"/>",
                                "pocetDalsichNFT": <xsl:value-of select="pocet"/>
                                }
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                ]
                }<xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
            ]
        },
        {
            "komodita": [
            <xsl:for-each select="portfolio/komodity/komodita">
                <xsl:choose>
                    <!-- Syntax checker -->
                    <xsl:when test="position() != last()">
                        {
                        "nazev": "<xsl:value-of select="nazev"/>",
                        "kod": "<xsl:value-of select="kod"/>",
                        "cena": <xsl:value-of select="cena"/>,
                        "mena": "<xsl:value-of select="cena/@mena"/>",
                        "trh": "<xsl:value-of select="trh"/>"
                        },
                    </xsl:when>
                    <xsl:otherwise>
                        {
                        "nazev": "<xsl:value-of select="nazev"/>",
                        "kod": "<xsl:value-of select="kod"/>",
                        "cena": <xsl:value-of select="cena"/>,
                        "mena": "<xsl:value-of select="cena/@mena"/>",
                        "trh": "<xsl:value-of select="trh"/>"
                        }
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            ]
        }
    ]
}
</xsl:template>
</xsl:stylesheet>