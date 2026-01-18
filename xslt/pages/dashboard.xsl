<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:import href="../layouts/main.xsl"/>

  <xsl:template match="/">
    <html lang="{/root/lang}" dir="{/root/dir}">
      <xsl:call-template name="html-head">
        <xsl:with-param name="title" select="/root/labels/label[@key='dashboard']"/>
      </xsl:call-template>
      <body class="app-layout">
        <xsl:call-template name="top-header"/>
        <div class="app-body" style="min-height: 100vh; display: flex; flex-direction: row;">
            <xsl:call-template name="sidebar"/>
            <main class="main-content" style="flex: 1; padding: 2rem; background-color: #f4f6f8;">
                
             <h1><xsl:value-of select="/root/labels/label[@key='welcome']"/> <span>, </span><xsl:value-of select="/root/content/currentUser/name"/></h1>
                
                <xsl:choose>
                    <xsl:when test="/root/userRole = 'admin'">
                        <div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 1.5rem; margin-bottom: 2rem;">
                            <div style="background: white; padding: 1.5rem; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); display: flex; flex-direction: column; justify-content: space-between;">
                                <h3 style="margin: 0; color: #8898aa; font-size: 0.85em; text-transform: uppercase; letter-spacing: 0.05em;"><xsl:value-of select="/root/labels/label[@key='total_users']"/></h3>
                                <div style="display: flex; align-items: baseline; gap: 0.5rem; margin-top: 0.5rem;">
                                    <span style="font-size: 2rem; font-weight: bold; color: #32325d;"><xsl:value-of select="/root/content/stats/usersCount"/></span>
                                </div>
                            </div>
                            <div style="background: white; padding: 1.5rem; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); display: flex; flex-direction: column; justify-content: space-between;">
                                <h3 style="margin: 0; color: #8898aa; font-size: 0.85em; text-transform: uppercase; letter-spacing: 0.05em;"><xsl:value-of select="/root/labels/label[@key='total_modules']"/></h3>
                                <div style="display: flex; align-items: baseline; gap: 0.5rem; margin-top: 0.5rem;">
                                    <span style="font-size: 2rem; font-weight: bold; color: #32325d;"><xsl:value-of select="/root/content/stats/classesCount"/></span>
                                </div>
                            </div>
                            <div style="background: #5e72e4; color: white; padding: 1.5rem; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); grid-column: span 2; display: flex; flex-direction: column; justify-content: center;">
                                <h3 style="margin: 0 0 1rem 0; font-size: 1.1em;"><xsl:value-of select="/root/labels/label[@key='quick_actions']"/></h3>
                                <div style="display: flex; gap: 1rem;">
                                    <a href="/users" class="btn btn-sm" style="background: white; color: #5e72e4; border: none; font-weight: 600;"><xsl:value-of select="/root/labels/label[@key='manage_users']"/></a>
                                    <a href="/classes" class="btn btn-sm" style="background: white; color: #5e72e4; border: none; font-weight: 600;"><xsl:value-of select="/root/labels/label[@key='manage_modules']"/></a>
                                </div>
                            </div>
                        </div>

                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1.5rem;">
                            <div style="background: white; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); overflow: hidden;">
                                <div style="padding: 1.25rem 1.5rem; border-bottom: 1px solid #e9ecef;">
                                    <h3 style="margin: 0; color: #32325d; font-size: 1.0625rem;"><xsl:value-of select="/root/labels/label[@key='recent_classes']"/></h3>
                                </div>
                                <table style="width:100%; border-collapse: collapse;">
                                    <thead style="background-color: #f6f9fc; color: #8898aa;">
                                        <tr>
                                            <th style="padding: 0.75rem 1.5rem; text-align: left; font-size: 0.75rem; text-transform: uppercase; letter-spacing: 1px;"><xsl:value-of select="/root/labels/label[@key='name']"/></th>
                                            <th style="padding: 0.75rem 1.5rem; text-align: left; font-size: 0.75rem; text-transform: uppercase; letter-spacing: 1px;"><xsl:value-of select="/root/labels/label[@key='year']"/></th>
                                            <th style="padding: 0.75rem 1.5rem; text-align: right; font-size: 0.75rem; text-transform: uppercase; letter-spacing: 1px;"><xsl:value-of select="/root/labels/label[@key='action']"/></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <xsl:if test="count(/root/content/recentClasses/class) = 0">
                                            <tr>
                                                <td colspan="3" style="padding: 1rem; text-align: center; color: #999;">No classes found.</td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:for-each select="/root/content/recentClasses/class">
                                            <tr style="border-bottom: 1px solid #e9ecef;">
                                                <td style="padding: 1rem 1.5rem; color: #525f7f;"><xsl:value-of select="name"/></td>
                                                <td style="padding: 1rem 1.5rem; color: #525f7f;"><xsl:value-of select="year"/> - <xsl:value-of select="semester"/></td>
                                                <td style="padding: 1rem 1.5rem; text-align: right;">
                                                    <a href="/classes/view/{id}" class="action-btn" style="background-color: #5e72e4; margin: 0;">
                                                        <xsl:value-of select="/root/labels/label[@key='view_resources']"/>
                                                    </a>
                                                </td>
                                            </tr>
                                        </xsl:for-each>
                                    </tbody>
                                </table>
                            </div>

                            <div style="background: white; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); overflow: hidden;">
                                <div style="padding: 1.25rem 1.5rem; border-bottom: 1px solid #e9ecef;">
                                    <h3 style="margin: 0; color: #32325d; font-size: 1.0625rem;"><xsl:value-of select="/root/labels/label[@key='recent_students']"/></h3>
                                </div>
                                <table style="width:100%; border-collapse: collapse;">
                                    <thead style="background-color: #f6f9fc; color: #8898aa;">
                                        <tr>
                                            <th style="padding: 0.75rem 1.5rem; text-align: left; font-size: 0.75rem; text-transform: uppercase; letter-spacing: 1px;"><xsl:value-of select="/root/labels/label[@key='name']"/></th>
                                            <th style="padding: 0.75rem 1.5rem; text-align: left; font-size: 0.75rem; text-transform: uppercase; letter-spacing: 1px;"><xsl:value-of select="/root/labels/label[@key='email']"/></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <xsl:if test="count(/root/content/recentStudents/student) = 0">
                                            <tr>
                                                <td colspan="2" style="padding: 1rem; text-align: center; color: #999;">No students found.</td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:for-each select="/root/content/recentStudents/student">
                                            <tr style="border-bottom: 1px solid #e9ecef;">
                                                <td style="padding: 1rem 1.5rem; color: #525f7f;"><xsl:value-of select="name"/></td>
                                                <td style="padding: 1rem 1.5rem; color: #525f7f;"><xsl:value-of select="email"/></td>
                                            </tr>
                                        </xsl:for-each>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </xsl:when>
                    <xsl:when test="/root/userRole = 'teacher'">
                        <div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 1.5rem; margin-bottom: 2rem;">
                            <div style="background: white; padding: 1.5rem; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); display: flex; flex-direction: column; justify-content: space-between;">
                                <h3 style="margin: 0; color: #8898aa; font-size: 0.85em; text-transform: uppercase; letter-spacing: 0.05em;"><xsl:value-of select="/root/labels/label[@key='total_modules']"/></h3>
                                <div style="display: flex; align-items: baseline; gap: 0.5rem; margin-top: 0.5rem;">
                                    <span style="font-size: 2rem; font-weight: bold; color: #32325d;"><xsl:value-of select="/root/content/stats/classesCount"/></span>
                                </div>
                            </div>
                            <div style="background: white; padding: 1.5rem; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); display: flex; flex-direction: column; justify-content: space-between;">
                                <h3 style="margin: 0; color: #8898aa; font-size: 0.85em; text-transform: uppercase; letter-spacing: 0.05em;"><xsl:value-of select="/root/labels/label[@key='total_students']"/></h3>
                                <div style="display: flex; align-items: baseline; gap: 0.5rem; margin-top: 0.5rem;">
                                    <span style="font-size: 2rem; font-weight: bold; color: #32325d;"><xsl:value-of select="/root/content/stats/totalStudents"/></span>
                                </div>
                            </div>
                        </div>

                        <div style="background: white; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); overflow: hidden;">
                            <div style="padding: 1.25rem 1.5rem; border-bottom: 1px solid #e9ecef;">
                                <h3 style="margin: 0; color: #32325d; font-size: 1.0625rem;"><xsl:value-of select="/root/labels/label[@key='my_classes']"/></h3>
                            </div>
                            <table style="width:100%; border-collapse: collapse;">
                                <thead style="background-color: #f6f9fc; color: #8898aa;">
                                    <tr>
                                        <th style="padding: 0.75rem 1.5rem; text-align: left;"><xsl:value-of select="/root/labels/label[@key='name']"/></th>
                                        <th style="padding: 0.75rem 1.5rem; text-align: left;"><xsl:value-of select="/root/labels/label[@key='student_count']"/></th>
                                        <th style="padding: 0.75rem 1.5rem; text-align: right;"><xsl:value-of select="/root/labels/label[@key='action']"/></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <xsl:for-each select="/root/content/myClasses/class">
                                        <tr style="border-bottom: 1px solid #e9ecef;">
                                            <td style="padding: 1rem 1.5rem;"><xsl:value-of select="name"/></td>
                                            <td style="padding: 1rem 1.5rem;"><xsl:value-of select="studentCount"/></td>
                                            <td style="padding: 1rem 1.5rem; text-align: right;">
                                                <a href="/classes/view/{id}" class="action-btn" style="background-color: #16a144; margin: 0;">
                                                    <xsl:value-of select="/root/labels/label[@key='view_resources']"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:for-each>
                                </tbody>
                            </table>
                        </div>
                    </xsl:when>
                    <xsl:when test="/root/userRole = 'student'">
                        <div style="display: grid; grid-template-columns: 2fr 1fr; gap: 1.5rem;">
                            <div style="background: white; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); overflow: hidden;">
                                <div style="padding: 1.25rem 1.5rem; border-bottom: 1px solid #e9ecef; background: #fff5eb;">
                                    <h3 style="margin: 0; color: #fd7e14; font-size: 1.0625rem;"><xsl:value-of select="/root/labels/label[@key='upcoming_planning']"/></h3>
                                </div>
                                <table style="width:100%; border-collapse: collapse;">
                                    <thead>
                                        <tr style="background-color: #fffaf5; color: #8898aa;">
                                            <th style="padding: 0.75rem 1.5rem; text-align: left;"><xsl:value-of select="/root/labels/label[@key='type']"/></th>
                                            <th style="padding: 0.75rem 1.5rem; text-align: left;">Class</th>
                                            <th style="padding: 0.75rem 1.5rem; text-align: left;"><xsl:value-of select="/root/labels/label[@key='date']"/></th>
                                            <th style="padding: 0.75rem 1.5rem; text-align: left;"><xsl:value-of select="/root/labels/label[@key='room']"/></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <xsl:if test="count(/root/content/upcomingPlanning/event) = 0">
                                            <tr>
                                                <td colspan="4" style="padding: 2rem; text-align: center; color: #999;">No upcoming events.</td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:for-each select="/root/content/upcomingPlanning/event">
                                            <tr style="border-bottom: 1px solid #e9ecef;">
                                                <td style="padding: 1rem 1.5rem;">
                                                    <span class="badge badge-{type}"><xsl:value-of select="type"/></span>
                                                </td>
                                                <td style="padding: 1rem 1.5rem;"><xsl:value-of select="className"/></td>
                                                <td style="padding: 1rem 1.5rem;"><xsl:value-of select="date"/> at <xsl:value-of select="time"/></td>
                                                <td style="padding: 1rem 1.5rem;"><xsl:value-of select="room"/></td>
                                            </tr>
                                        </xsl:for-each>
                                    </tbody>
                                </table>
                            </div>
                            <div style="background: white; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); overflow: hidden;">
                                <div style="padding: 1.25rem 1.5rem; border-bottom: 1px solid #e9ecef;">
                                    <h3 style="margin: 0; color: #32325d; font-size: 1.0625rem;"><xsl:value-of select="/root/labels/label[@key='my_classes']"/></h3>
                                </div>
                                <div style="padding: 1rem;">
                                    <xsl:for-each select="/root/content/myClasses/class">
                                        <div style="padding: 0.75rem; border-bottom: 1px solid #eee; display: flex; justify-content: space-between; align-items: center;">
                                            <span style="font-weight: 500;"><xsl:value-of select="name"/></span>
                                            <a href="/classes/view/{id}" class="btn btn-sm" style="padding: 0.25rem 0.5rem; background: #e0e7ff; color: #4338ca;">
                                                <xsl:value-of select="/root/labels/label[@key='view_resources']"/>
                                            </a>
                                        </div>
                                    </xsl:for-each>
                                </div>
                            </div>
                        </div>
                    </xsl:when>
                    <xsl:otherwise>
                         <div style="background: white; padding: 2rem; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); max-width: 600px;">
                              <h2 style="margin-top:0; color: #32325d;">My Status</h2>
                              <div style="display: flex; align-items: center; gap: 1rem; margin-top: 1rem;">
                                  <span class="badge badge-{/root/content/currentUser/role}" style="font-size: 1rem; padding: 0.5rem 1rem;"><xsl:value-of select="/root/content/currentUser/role"/></span>
                                  <p style="margin: 0; color: #525f7f;">Logged in as <strong style="color: #32325d;"><xsl:value-of select="/root/content/currentUser/email"/></strong></p>
                              </div>
                          </div>
                    </xsl:otherwise>
                </xsl:choose>

            </main>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
