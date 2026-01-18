<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:import href="../layouts/main.xsl"/>

  <xsl:template match="/">
    <html lang="{/root/lang}" dir="{/root/dir}">
      <xsl:call-template name="html-head">
        <xsl:with-param name="title"><xsl:value-of select="/root/labels/label[@key='assign_classes']"/></xsl:with-param>
      </xsl:call-template>
      <body class="app-layout">
        <xsl:call-template name="top-header"/>
        <div class="app-body">
            <xsl:call-template name="sidebar"/>
            <main class="main-content">
                <div class="content-card" style="max-width: 600px;">
                  <h1><xsl:value-of select="/root/labels/label[@key='assign_classes']"/> - <xsl:value-of select="/root/content/student/name"/></h1>
                  
                  <form action="/users/assign/{/root/content/student/id}" method="POST">
                    <div style="margin-bottom: 1.5rem;">
                        <table style="width:100%; border-collapse: collapse;">
                            <thead>
                                <tr style="border-bottom: 2px solid #eee; text-align: left;">
                                    <th style="padding: 0.5rem;"><xsl:value-of select="/root/labels/label[@key='assign']"/></th>
                                    <th style="padding: 0.5rem;"><xsl:value-of select="/root/labels/label[@key='classes']"/></th>
                                    <th style="padding: 0.5rem;"><xsl:value-of select="/root/labels/label[@key='year']"/>/<xsl:value-of select="/root/labels/label[@key='semester']"/></th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="/root/content/classes/class">
                                    <tr style="border-bottom: 1px solid #f9f9f9;">
                                        <td style="padding: 0.5rem;">
                                            <input type="checkbox" name="classIds" value="{id}">
                                                <xsl:if test="isAssigned = 'true'">
                                                    <xsl:attribute name="checked">checked</xsl:attribute>
                                                </xsl:if>
                                            </input>
                                        </td>
                                        <td style="padding: 0.5rem;">
                                            <strong><xsl:value-of select="name"/></strong>
                                        </td>
                                        <td style="padding: 0.5rem; color: #666;">
                                            <xsl:value-of select="year"/> - <xsl:value-of select="semester"/>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </div>
                    
                    <div style="display: flex; gap: 1rem; margin-top: 1.5rem;">
                      <a href="/users" class="btn btn-secondary"><xsl:value-of select="/root/labels/label[@key='cancel']"/></a>
                      <button type="submit" class="btn"><xsl:value-of select="/root/labels/label[@key='update_assignments']"/></button>
                    </div>
                  </form>
                </div>
            </main>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
