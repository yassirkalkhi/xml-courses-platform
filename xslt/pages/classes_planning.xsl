<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:import href="../layouts/main.xsl"/>

  <xsl:template match="/">
    <html lang="{/root/lang}" dir="{/root/dir}">
      <xsl:call-template name="html-head">
        <xsl:with-param name="title"><xsl:value-of select="/root/labels/label[@key='edit_planning']"/></xsl:with-param>
      </xsl:call-template>
      <body class="app-layout">
        <xsl:call-template name="top-header"/>
        <div class="app-body">
            <xsl:call-template name="sidebar"/>
            <main class="main-content">
                <div class="content-card">
                  <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
                    <div>
                        <h1 style="margin: 0;"><xsl:value-of select="/root/labels/label[@key='planning']"/></h1>
                        <p style="color: #666; margin: 0.5rem 0 0 0;">
                            <xsl:value-of select="/root/content/class/name"/>   
                        </p>
                    </div>
                    <div>
                        <a href="/classes/view/{/root/content/class/id}" class="btn btn-secondary"><xsl:value-of select="/root/labels/label[@key='back_to_details']"/></a>
                    </div>
                  </div>

                  <!-- Add/Edit Event Section -->
                  <div style="background: #f9f9f9; padding: 1.5rem; border-radius: 8px; margin-bottom: 2rem;">
                    <h3 style="margin-top: 0; margin-bottom: 1rem;">
                        <xsl:choose>
                            <xsl:when test="/root/content/editEvent">
                                <xsl:value-of select="/root/labels/label[@key='edit_planning']"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="/root/labels/label[@key='add_event']"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </h3>
                    <form action="/classes/planning/{/root/content/class/id}" method="POST" style="display: flex; flex-wrap: wrap; gap: 1rem; align-items: flex-end;">
                        <xsl:if test="/root/content/editEvent">
                            <input type="hidden" name="eventId" value="{/root/content/editEvent/id}"/>
                        </xsl:if>
                        
                        <div class="form-group" style="flex: 1; min-width: 150px; margin-bottom: 0;">
                            <label><xsl:value-of select="/root/labels/label[@key='type']"/></label>
                            <select name="type" required="required">
                                <option value="TP">
                                    <xsl:if test="/root/content/editEvent/type = 'TP'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
                                    <xsl:value-of select="/root/labels/label[@key='tp']"/>
                                </option>
                                <option value="Exam">
                                    <xsl:if test="/root/content/editEvent/type = 'Exam'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
                                    <xsl:value-of select="/root/labels/label[@key='exam']"/>
                                </option>
                            </select>
                        </div>
                        <div class="form-group" style="flex: 1; min-width: 150px; margin-bottom: 0;">
                            <label><xsl:value-of select="/root/labels/label[@key='date']"/></label>
                            <input type="date" name="date" required="required" value="{/root/content/editEvent/date}"/>
                        </div>
                        <div class="form-group" style="flex: 1; min-width: 120px; margin-bottom: 0;">
                            <label><xsl:value-of select="/root/labels/label[@key='time']"/></label>
                            <input type="time" name="time" required="required" value="{/root/content/editEvent/time}"/>
                        </div>
                        <div class="form-group" style="flex: 1; min-width: 120px; margin-bottom: 0;">
                            <label><xsl:value-of select="/root/labels/label[@key='room']"/></label>
                            <input type="text" name="room" required="required" placeholder="e.g. Lab 1" value="{/root/content/editEvent/room}"/>
                        </div>
                        <xsl:if test="/root/content/editEvent">
                            <a href="/classes/planning/{/root/content/class/id}" class="btn btn-secondary" style="  display: flex; align-items: center;"><xsl:value-of select="/root/labels/label[@key='cancel']"/></a>
                        </xsl:if>
                        <button type="submit" class="btn">
                             <xsl:choose>
                                <xsl:when test="/root/content/editEvent">
                                    <xsl:value-of select="/root/labels/label[@key='save_changes']"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="/root/labels/label[@key='add_event']"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </button>
                    
                    </form>
                  </div>

                  <div>
                    <table style="width:100%; border-collapse: collapse;">
                        <thead>
                            <tr style="border-bottom: 2px solid #eee; text-align: left;">
                                <th style="padding: 0.75rem;"><xsl:value-of select="/root/labels/label[@key='type']"/></th>
                                <th style="padding: 0.75rem;"><xsl:value-of select="/root/labels/label[@key='date']"/></th>
                                <th style="padding: 0.75rem;"><xsl:value-of select="/root/labels/label[@key='time']"/></th>
                                <th style="padding: 0.75rem;"><xsl:value-of select="/root/labels/label[@key='room']"/></th>
                                <th style="padding: 0.75rem; text-align: right;"><xsl:value-of select="/root/labels/label[@key='action']"/></th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:if test="count(/root/content/planning/event) = 0">
                                <tr>
                                    <td colspan="5" style="padding: 1rem; text-align: center; color: #999;">No events planned.</td>
                                </tr>
                            </xsl:if>
                            <xsl:for-each select="/root/content/planning/event">
                                <tr style="border-bottom: 1px solid #eee;">
                                    <td style="padding: 0.75rem;">
                                        <span class="badge badge-{type}">
                                            <xsl:choose>
                                                <xsl:when test="type = 'TP'"><xsl:value-of select="/root/labels/label[@key='tp']"/></xsl:when>
                                                <xsl:otherwise><xsl:value-of select="/root/labels/label[@key='exam']"/></xsl:otherwise>
                                            </xsl:choose>
                                        </span>
                                    </td>
                                    <td style="padding: 0.75rem;"><xsl:value-of select="date"/></td>
                                    <td style="padding: 0.75rem;"><xsl:value-of select="time"/></td>
                                    <td style="padding: 0.75rem;"><xsl:value-of select="room"/></td>
                                    <td style="padding: 0.75rem; text-align: right;">
                                        <a href="/classes/planning/{../../class/id}?editId={id}" class="action-btn" style="background-color: #c1c1c1ffff; margin-right: 0.5rem;"><xsl:value-of select="/root/labels/label[@key='edit']"/></a>
                                        <a href="/classes/{../../class/id}/delete-event/{id}" class="action-btn" style="background-color: #ef4444ff;" onclick="return confirm('{/root/labels/label[@key='are_you_sure']}')"><xsl:value-of select="/root/labels/label[@key='delete']"/></a>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                  </div>
                </div>
            </main>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
