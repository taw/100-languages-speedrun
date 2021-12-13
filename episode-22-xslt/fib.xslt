<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text"/>

  <xsl:template name="fib">
    <xsl:param name="n"/>
     <xsl:choose>
        <xsl:when test="2 >= $n">1</xsl:when>
        <xsl:otherwise>
          <xsl:variable name="a">
            <xsl:call-template name="fib">
              <xsl:with-param name="n" select="$n - 1"/>
            </xsl:call-template>
          </xsl:variable>
          <xsl:variable name="b">
            <xsl:call-template name="fib">
              <xsl:with-param name="n" select="$n - 2"/>
            </xsl:call-template>
          </xsl:variable>
        <xsl:value-of select="$a + $b"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="iteration">
    <xsl:param name="i" />
    <xsl:param name="max" />

    <xsl:text>fib(</xsl:text>
    <xsl:value-of select="$i"/>
    <xsl:text>) = </xsl:text>
    <xsl:call-template name="fib">
      <xsl:with-param name="n" select="$i"/>
    </xsl:call-template>
    <xsl:text>&#10;</xsl:text>
    <xsl:if test="$max > $i">
      <xsl:call-template name="iteration">
        <xsl:with-param name="i" select="$i + 1"/>
        <xsl:with-param name="max" select="$max"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template match="/fib-sequence">
    <xsl:call-template name="iteration">
      <xsl:with-param name="i" select="1"/>
      <xsl:with-param name="max" select="."/>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
