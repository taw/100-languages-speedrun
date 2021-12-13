<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text"/>

  <xsl:template match="/fizzbuzz"><xsl:apply-templates select="number"/></xsl:template>

  <xsl:template match="number">
    <xsl:variable name="i" select="." />
    <xsl:choose>
      <xsl:when test="$i mod 15 = 0">FizzBuzz</xsl:when>
      <xsl:when test="$i mod 3 = 0">Fizz</xsl:when>
      <xsl:when test="$i mod 5 = 0">Buzz</xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$i" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>
</xsl:stylesheet>
