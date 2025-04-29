<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    exclude-result-prefixes="xsi">
  <xsl:output method="text" encoding="UTF-8" />
  
  <xsl:template match="/QuickCare">
    {
      "QuickCare": {
        "Users": [
          <xsl:for-each select="User">
            <xsl:apply-templates select="." />
            <xsl:if test="position() != last()">,</xsl:if>
          </xsl:for-each>
        ],
        "Doctors": [
          <xsl:for-each select="Doctor">
            <xsl:apply-templates select="." />
            <xsl:if test="position() != last()">,</xsl:if>
          </xsl:for-each>
        ],
        "PricingPlans": [
          <xsl:for-each select="PricingPlan">
            <xsl:apply-templates select="." />
            <xsl:if test="position() != last()">,</xsl:if>
          </xsl:for-each>
        ],
        "Articles": [
          <xsl:for-each select="Article">
            <xsl:apply-templates select="." />
            <xsl:if test="position() != last()">,</xsl:if>
          </xsl:for-each>
        ]
      }
    }
  </xsl:template>

  <xsl:template match="User">
    {
      "ID": "<xsl:value-of select="@ID" />",
      "Created": "<xsl:value-of select="@Created" />",
      "ValidInsurance": <xsl:value-of select="@ValidInsurance" />,
      "FirstName": "<xsl:value-of select="FirstName" />",
      "LastName": "<xsl:value-of select="LastName" />",
      "Email": "<xsl:value-of select="Email" />",
      "PhoneNumber": "<xsl:value-of select="PhoneNumber" />",
      "Subscribtion": "<xsl:value-of select="Subscribtion" />",
      "Location": {
        "City": "<xsl:value-of select="Location/City" />",
        "Street": "<xsl:value-of select="Location/Street" />",
        "PostalCode": "<xsl:value-of select="Location/PostalCode" />",
        "Country": "<xsl:value-of select="Location/Country" />"
      }
    }
  </xsl:template>

  <xsl:template match="Doctor">
    {
      "ID": "<xsl:value-of select="@ID" />",
      "Active": <xsl:value-of select="if (@Active) then @Active else 'null'" />,
      "Contracted": <xsl:value-of select="if (@Contracted) then @Contracted else 'null'" />,
      "Language": "<xsl:value-of select="@Language" />",
      "Rating": <xsl:value-of select="if (@Rating) then @Rating else 'null'" />,
      "FirstName": "<xsl:value-of select="FirstName" />",
      "LastName": "<xsl:value-of select="LastName" />",
      "Title": "<xsl:value-of select="Title" />",
      "Specialization": "<xsl:value-of select="Specialization" />",
      "YearsOfPractice": <xsl:value-of select="YearsOfPractice" />,
      "WorkHistory": "<xsl:value-of select="WorkHistory" />",
      "Gender": "<xsl:value-of select="Gender" />",
      "Availability": "<xsl:value-of select="Availability" />"
    }
  </xsl:template>

  <xsl:template match="PricingPlan">
    {
      "PlanName": "<xsl:value-of select="PlanName" />",
      "PricePerCharge": <xsl:value-of select="PricePerCharge" />,
      "Features": [
        <xsl:for-each select="Features/Feature">
          "<xsl:value-of select="." />"<xsl:if test="position() != last()">,</xsl:if>
        </xsl:for-each>
      ],
      "PricingModel": "<xsl:value-of select="PricingModel" />"
    }
  </xsl:template>

  <xsl:template match="Article">
    {
      "Title": "<xsl:value-of select="@Title" />",
      "Topic": "<xsl:value-of select="@Topic" />",
      "Author": {
        "FirstName": "<xsl:value-of select="Author/FirstName" />",
        "LastName": "<xsl:value-of select="Author/LastName" />"
      },
      "DatePublished": "<xsl:value-of select="DatePublished" />",
      "Content": "<xsl:value-of select="Content" />"
    }
  </xsl:template>
</xsl:stylesheet>
