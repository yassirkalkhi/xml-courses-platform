<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:import href="../layouts/main.xsl"/>

  <xsl:template match="/">
    <html lang="{/root/lang}" dir="{/root/dir}">
      <xsl:call-template name="html-head">
        <xsl:with-param name="title" select="/root/labels/label[@key='classes']"/>
      </xsl:call-template>
      <body class="app-layout">
        <xsl:call-template name="top-header"/>
        <div class="app-body">
            <xsl:call-template name="sidebar"/>
            <main class="main-content">
                  <div class="content-card">
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1rem;">
                      <h1 style="margin: 0;"><xsl:value-of select="/root/labels/label[@key='classes']"/></h1>
                      
                      <xsl:if test="/root/session/role = 'admin'">
                          <a href="/classes/create" class="btn">+ <xsl:value-of select="/root/labels/label[@key='create_class']"/></a>
                      </xsl:if>
                    </div>
                    
                    <table style="width:100%; border-collapse: collapse; margin-top: 1rem;">
                    <thead>
                      <tr style="border-bottom: 2px solid #eee; text-align: left;">
                        <th style="padding: 1rem; font-weight: normal;"><xsl:value-of select="/root/labels/label[@key='name']"/></th>
                        <th style="padding: 1rem; font-weight: normal;"><xsl:value-of select="/root/labels/label[@key='year']"/></th>
                        <th style="padding: 1rem; font-weight: normal;"><xsl:value-of select="/root/labels/label[@key='semester']"/></th>
                        <th style="padding: 1rem; font-weight: normal;"><xsl:value-of select="/root/labels/label[@key='files']"/></th>
                        <th style="padding: 1rem; text-align: right; font-weight: normal;"><xsl:value-of select="/root/labels/label[@key='action']"/></th>
                      </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="/root/content/classes/class">
                          <tr style="border-bottom: 1px solid #eee;">
                            <td style="padding: 1rem;">
                                <xsl:value-of select="name"/> 
                            </td>
                            <td style="padding: 1rem;">
                                <xsl:value-of select="year"/> 
                            </td>
                            <td style="padding: 1rem;">
                                <xsl:value-of select="semester"/> 
                            </td>
                            <td style="padding: 1rem;">
                                <xsl:value-of select="count(contents/content)"/>
                            </td>
                            <td style="padding: 1rem; text-align: right;">
                              <div class="dropdown">
                                <button class="btn-actions" style="padding: 0.4rem 0.6rem;">
                                  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>
                                </button>
                                <div class="dropdown-content">
                                  <a href="/classes/participants/{id}">
                                    <xsl:value-of select="/root/labels/label[@key='participants']"/>
                                  </a>
                                  <a href="/classes/view/{id}">
                                    <xsl:value-of select="/root/labels/label[@key='view_resources']"/>
                                  </a>
                                  <a href="/classes/planning/view/{id}">
                                    <xsl:value-of select="/root/labels/label[@key='view_planning']"/>
                                  </a>
                                  
                                  <xsl:if test="/root/session/role = 'admin'">
                                    <hr style="border: 0; border-top: 1px solid #eee; margin: 0.25rem 0;" />
                                    <a href="/classes/edit/{id}">
                                      <xsl:value-of select="/root/labels/label[@key='edit']"/>
                                    </a>
                                    <a href="/classes/delete/{id}" style="color: #ef4444;" onclick="return confirm('{/root/labels/label[@key='are_you_sure']}')">
                                      <xsl:value-of select="/root/labels/label[@key='delete']"/>
                                    </a>
                                  </xsl:if>
                                </div>
                              </div>
                            </td>
                          </tr>
                        </xsl:for-each>
                    </tbody>
                  </table>
                  </div>
            </main>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
