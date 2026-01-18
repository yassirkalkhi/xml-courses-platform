<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:import href="../layouts/main.xsl"/>

  <xsl:template match="/">
    <html lang="{/root/lang}" dir="{/root/dir}">
      <xsl:call-template name="html-head">
        <xsl:with-param name="title"><xsl:value-of select="/root/labels/label[@key='edit_class']"/></xsl:with-param>
      </xsl:call-template>
      <body class="app-layout">
        <xsl:call-template name="top-header"/>
        <div class="app-body">
            <xsl:call-template name="sidebar"/>
            <main class="main-content">
                <div class="content-card" style="max-width: 500px;">
                  <h1><xsl:value-of select="/root/labels/label[@key='edit_class']"/></h1>
                  
                  <form action="/classes/edit/{/root/content/class/id}" method="POST">
                    <div class="form-group">
                      <label><xsl:value-of select="/root/labels/label[@key='name']"/></label>
                      <input type="text" name="name" value="{/root/content/class/name}" required="required"/>
                    </div>

                     <div class="form-group">
                      <label><xsl:value-of select="/root/labels/label[@key='year']"/></label>
                      <select name="year" required="required">
                        <option value="1">
                            <xsl:if test="/root/content/class/year = '1'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
                            <xsl:value-of select="/root/labels/label[@key='1st_year']"/>
                        </option>
                        <option value="2">
                             <xsl:if test="/root/content/class/year = '2'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
                             <xsl:value-of select="/root/labels/label[@key='2nd_year']"/>
                        </option>
                        <option value="3">
                             <xsl:if test="/root/content/class/year = '3'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
                             <xsl:value-of select="/root/labels/label[@key='3rd_year']"/>
                        </option>
                      </select>
                    </div>

                    <div class="form-group">
                      <label><xsl:value-of select="/root/labels/label[@key='semester']"/></label>
                      <select name="semester" required="required">
                         <option value="S1"><xsl:if test="/root/content/class/semester = 'S1'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>S1</option>
                         <option value="S2"><xsl:if test="/root/content/class/semester = 'S2'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>S2</option>
                         <option value="S3"><xsl:if test="/root/content/class/semester = 'S3'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>S3</option>
                         <option value="S4"><xsl:if test="/root/content/class/semester = 'S4'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>S4</option>
                         <option value="S5"><xsl:if test="/root/content/class/semester = 'S5'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>S5</option>
                         <option value="S6"><xsl:if test="/root/content/class/semester = 'S6'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>S6</option>
                      </select>
                    </div>

                    <div class="form-group">
                      <label><xsl:value-of select="/root/labels/label[@key='assign_teacher']"/></label>
                      <select name="teacherIds" required="required">
                        <option value=""><xsl:value-of select="/root/labels/label[@key='select_teacher']"/></option>
                        <xsl:for-each select="/root/content/teachers/teacher">
                           <option value="{id}">
                                <xsl:if test="count(/root/content/class/existingTeacherIds/id[. = current()/id]) > 0">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                </xsl:if>
                               <xsl:value-of select="name"/>
                           </option>
                        </xsl:for-each>
                      </select>
                    </div>

                    <div class="form-group">
                      <label><xsl:value-of select="/root/labels/label[@key='assign_class_student']"/></label>
                      <div style="max-height: 200px; overflow-y: auto; border: 1px solid #ccc; padding: 0.5rem; border-radius: 4px; background: white;">
                        <xsl:for-each select="/root/content/students/student">
                           <div style="display: flex; justify-content: space-between; align-items: center; padding: 0.5rem; border-bottom: 1px solid #eee;">
                               <label for="s-{id}" style="cursor: pointer; flex: 1;"><xsl:value-of select="name"/></label>
                               <input type="checkbox" name="studentIds" value="{id}" id="s-{id}">
                                    <xsl:if test="count(/root/content/class/existingStudentIds/id[. = current()/id]) > 0">
                                        <xsl:attribute name="checked">checked</xsl:attribute>
                                    </xsl:if>
                               </input>
                           </div>
                        </xsl:for-each>
                      </div>
                    </div>

                    <div style="display: flex; gap: 1rem; margin-top: 1.5rem;">
                      <a href="/classes" class="btn btn-secondary"><xsl:value-of select="/root/labels/label[@key='cancel']"/></a>
                      <button type="submit" class="btn"><xsl:value-of select="/root/labels/label[@key='save_changes']"/></button>
                    </div>
                  </form>
                </div>
            </main>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
