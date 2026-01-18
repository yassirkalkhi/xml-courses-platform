<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:import href="../layouts/main.xsl"/>

  <xsl:template match="/">
    <html lang="{/root/lang}" dir="{/root/dir}">
      <xsl:call-template name="html-head">
        <xsl:with-param name="title"><xsl:value-of select="/root/labels/label[@key='create_class']"/></xsl:with-param>
      </xsl:call-template>
      <body class="app-layout">
        <xsl:call-template name="top-header"/>
        <div class="app-body">
            <xsl:call-template name="sidebar"/>
            <main class="main-content">
                <div class="content-card" style="max-width: 500px;">
                  <h1><xsl:value-of select="/root/labels/label[@key='create_class']"/></h1>
                  
                  <form action="/classes/create" method="POST">
                    <div class="form-group">
                      <label><xsl:value-of select="/root/labels/label[@key='name']"/></label>
                      <input type="text" name="name" required="required" placeholder="e.g. Module A"/>
                    </div>
                    
                    <div class="form-group">
                      <label><xsl:value-of select="/root/labels/label[@key='year']"/></label>
                      <select name="year" required="required">
                        <option value="1"><xsl:value-of select="/root/labels/label[@key='1st_year']"/></option>
                        <option value="2"><xsl:value-of select="/root/labels/label[@key='2nd_year']"/></option>
                        <option value="3"><xsl:value-of select="/root/labels/label[@key='3rd_year']"/></option>
                      </select>
                    </div>

                    <div class="form-group">
                      <label><xsl:value-of select="/root/labels/label[@key='semester']"/></label>
                      <select name="semester" required="required">
                        <option value="S1">S1</option>
                        <option value="S2">S2</option>
                        <option value="S3">S3</option>
                        <option value="S4">S4</option>
                        <option value="S5">S5</option>
                        <option value="S6">S6</option>
                      </select>
                    </div>

                    <div class="form-group">
                      <label><xsl:value-of select="/root/labels/label[@key='assign_teacher']"/></label>
                      <select name="teacherIds" required="required">
                        <option value=""><xsl:value-of select="/root/labels/label[@key='select_teacher']"/></option>
                        <xsl:for-each select="/root/content/teachers/teacher">
                           <option value="{id}"><xsl:value-of select="name"/></option>
                        </xsl:for-each>
                      </select>
                    </div>

                    <div style="display: flex; gap: 1rem; margin-top: 1.5rem;">
                      <a href="/classes" class="btn btn-secondary"><xsl:value-of select="/root/labels/label[@key='cancel']"/></a>
                      <button type="submit" class="btn"><xsl:value-of select="/root/labels/label[@key='create_class']"/></button>
                    </div>
                  </form>
                </div>
            </main>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
