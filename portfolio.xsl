<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes" doctype-system="about:legacy-compat" />


    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" vocab="https://schema.org/">
            <head>
                <title>Portfolio - <xsl:value-of select="CV/PersonalInfo/Name"/></title>
                
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <link rel="stylesheet" type="text/css" href="portfolio.css"/>
                <script src="lang.js"/>



                <link rel="alternate" type="application/rdf+xml" href="portfolio.rdf" title="RDF representation of this portfolio" />
                <link rel="schema.rdfs" type="application/rdf+xml" href="cv-schema.rdfs" title="RDFS Schema for this portfolio" />
                <link rel="alternate" type="application/xml" href="portefolio.xml" title="Original XML data for this portfolio" />
                <link rel="schema" type="application/xml" href="portefolio.xsd" title="XSD Schema for this portfolio" />
            </head>
            <body>

                <div class="lang-switcher">
                    <span data-lang-en="Language:" data-lang-fr="Langue :" data-lang-zh="语言 :">Language:</span>
                    <button onclick="setLang('en')">🇬🇧 English</button>
                    <button onclick="setLang('fr')">🇫🇷 Français</button>
                    <button onclick="setLang('zh')">🇨🇳 中文</button>
                </div>

                <header typeof="Person" about="#me">
                    <img property="image" src="{CV/PersonalInfo/Name/@image}" alt="Ma photo" class="profile-photo" loading="lazy"/>
                    <h1 property="name"><xsl:value-of select="CV/PersonalInfo/Name"/></h1>
                    <div class="contact">
                        <div><span property="telephone"><xsl:value-of select="CV/PersonalInfo/Phone"/></span></div>
                        <div><span property="email"><xsl:value-of select="CV/PersonalInfo/Email"/></span></div>
                        <div>
                            <span data-lang-en="Internship : " data-lang-fr="Stage : " data-lang-zh="实习 :*">Internship:</span>
                            <xsl:for-each select="CV/PersonalInfo/InternshipSearch/Duration/Lang">
                                <span class="lang-content" data-lang-id="{@id}"><xsl:value-of select="."/></span>
                            </xsl:for-each>
                            <span data-lang-en=" between " data-lang-fr=" entre " data-lang-zh=" 在 "> between </span>
                            <xsl:for-each select="CV/PersonalInfo/InternshipSearch/Period/Lang">
                                <span class="lang-content" data-lang-id="{@id}"><xsl:value-of select="."/></span>
                            </xsl:for-each>
                        </div>
                    </div>
                </header>

                <section about="#me">
                    <h2>
                        <span data-lang-en="Professional Summary" data-lang-fr="Résumé professionnel" data-lang-zh="专业概况">
                            Professional Summary
                        </span>
                    </h2>
                    <p property="description">
                        <xsl:for-each select="CV/ProfessionalSummary/Text/Lang">
                            <span class="lang-content" data-lang-id="{@id}"><xsl:value-of select="."/></span>
                        </xsl:for-each>
                    </p>
                </section>

                <section>
                    <h2>
                        <span data-lang-en="Education" data-lang-fr="Formation" data-lang-zh="教育背景">Education</span>
                    </h2>
                    <xsl:for-each select="CV/Education/Degree">
                        <p typeof="EducationalOccupationalCredential">
                            <strong>
                                <xsl:for-each select="Title/Lang">
                                    <span class="lang-content" data-lang-id="{@id}" property="name"><xsl:value-of select="."/></span>
                                </xsl:for-each>
                            </strong>
                            —
                            <xsl:for-each select="Institution/Lang">
                                <span class="lang-content" data-lang-id="{@id}" property="educationalCredentialAwardedBy"><xsl:value-of select="."/></span>
                            </xsl:for-each>
                            <br/>
                            <xsl:if test="Type">
                                <em>
                                    <xsl:for-each select="Type/Lang">
                                        <span class="lang-content" data-lang-id="{@id}" property="credentialCategory"><xsl:value-of select="."/></span>
                                    </xsl:for-each>
                                </em>
                            </xsl:if>
                            <span property="startDate" content="{substring(Years, 1, 4)}"></span>
                            <span property="endDate" content="{substring(Years, 8, 4)}"></span>
                            <xsl:value-of select="Years"/>
                        </p>
                    </xsl:for-each>
                </section>

                <section>
                    <h2>
                        <span data-lang-en="Work Experience" data-lang-fr="Expérience professionnelle" data-lang-zh="工作经验">
                            Work Experience
                        </span>
                    </h2>
                    <xsl:for-each select="CV/WorkExperience/Job">
                        <p typeof="Occupation">
                            <strong>
                                <xsl:for-each select="Title/Lang">
                                    <span class="lang-content" data-lang-id="{@id}" property="name"><xsl:value-of select="."/></span>
                                </xsl:for-each>
                            </strong>
                            — <span property="worksFor"><xsl:value-of select="Company"/></span> (<span property="startDate" content="{substring-before(Years, ' – ')}"></span><span property="endDate" content="{substring-after(Years, ' – ')}"></span><xsl:value-of select="Years"/>)
                            <ul>
                                <xsl:for-each select="Responsibilities/Task">
                                    <li property="responsibilities">
                                        <xsl:for-each select="Lang">
                                            <span class="lang-content" data-lang-id="{@id}"><xsl:value-of select="."/></span>
                                        </xsl:for-each>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </p>
                    </xsl:for-each>
                </section>

                <section about="#me">
                    <h2>
                        <span data-lang-en="Technical Skills" data-lang-fr="Compétences techniques" data-lang-zh="技术技能">
                            Technical Skills
                        </span>
                    </h2>
                    <p><strong><span data-lang-en="Business Intelligence" data-lang-fr="Informatique décisionnelle" data-lang-zh="商业智能">Business Intelligence</span>:</strong>
                        <xsl:for-each select="CV/TechnicalSkills/BusinessIntelligence/Tool">
                            <span property="knowsAbout"><xsl:value-of select="."/></span><xsl:if test="position() != last()">, </xsl:if>
                        </xsl:for-each>
                    </p>
                    <p><strong><span data-lang-en="Programming Languages" data-lang-fr="Langages de programmation" data-lang-zh="编程语言">Programming Languages</span>:</strong>
                        <xsl:for-each select="CV/TechnicalSkills/ProgrammingLanguages/Language">
                            <span property="programmingLanguage"><xsl:value-of select="."/></span><xsl:if test="position() != last()">, </xsl:if>
                        </xsl:for-each>
                    </p>
                    <p><strong><span data-lang-en="Data Management" data-lang-fr="Gestion de données" data-lang-zh="数据管理">Data Management</span>:</strong>
                        <xsl:for-each select="CV/TechnicalSkills/DataManagement/Skill">
                            <span property="knowsAbout"><xsl:value-of select="."/></span><xsl:if test="position() != last()">, </xsl:if>
                        </xsl:for-each>
                    </p>
                    <p><strong><span data-lang-en="Software &amp; Tools : " data-lang-fr="Logiciels &amp; Outils : " data-lang-zh="软件与工具 : "></span></strong>
                        <xsl:for-each select="CV/TechnicalSkills/SoftwareTools/Tool">
                            <span property="knowsAbout"><xsl:value-of select="."/></span><xsl:if test="position() != last()">, </xsl:if>
                        </xsl:for-each>
                    </p>
                    <p><strong><span data-lang-en="Operating Systems" data-lang-fr="Systèmes d'exploitation" data-lang-zh="操作系统">Operating Systems</span>:</strong>
                        <xsl:for-each select="CV/TechnicalSkills/OperatingSystems/System">
                            <span property="operatingSystem"><xsl:value-of select="."/></span><xsl:if test="position() != last()">, </xsl:if>
                        </xsl:for-each>
                    </p>
                </section>

                <section about="#me">
                    <h2>
                        <span data-lang-en="Languages" data-lang-fr="Langues" data-lang-zh="语言">Languages</span>
                    </h2>
                    <ul>
                        <xsl:for-each select="CV/Languages/Language">
                            <li property="knowsLanguage">
                                <xsl:value-of select="Name"/> (<xsl:value-of select="Level"/>)
                                <xsl:if test="Certification"> - <em><xsl:value-of select="Certification"/></em></xsl:if>
                            </li>
                        </xsl:for-each>
                    </ul>
                </section>

                <section>
                    <h2>
                        <span data-lang-en="Projects" data-lang-fr="Projets" data-lang-zh="项目">Projects</span>
                    </h2>
                    <xsl:for-each select="CV/Projects/Project">
                        <div class="project" typeof="CreativeWork">
                            <strong>
                                <xsl:for-each select="Title/Lang">
                                    <span class="lang-content" data-lang-id="{@id}" property="name"><xsl:value-of select="."/></span>
                                </xsl:for-each>
                            </strong>
                            (<span property="datePublished"><xsl:value-of select="Year"/></span>)
                            <xsl:if test="@image">
                                <img property="image" src="{@image}" alt="Image du projet" class="project-image" loading="lazy"/>
                            </xsl:if>
                            <p>
                                <xsl:for-each select="Description/Lang">
                                    <span class="lang-content" data-lang-id="{@id}" property="description"><xsl:value-of select="."/></span>
                                </xsl:for-each>
                            </p>
                            <xsl:if test="Link">
                                <p>
                                    <a property="url" href="{Link}" target="_blank" rel="noopener noreferrer">
                                        <span data-lang-en="Link to Project" data-lang-fr="Lien vers le projet" data-lang-zh="项目链接">Link to Project</span>
                                    </a>
                                </p>
                            </xsl:if>
                            <xsl:if test="LoginInfo">
                                <p>
                                    <em>
                                        <xsl:for-each select="LoginInfo/Lang">
                                            <span class="lang-content" data-lang-id="{@id}"><xsl:value-of select="."/></span>
                                        </xsl:for-each>
                                    </em>
                                </p>
                            </xsl:if>
                        </div>
                    </xsl:for-each>


<xsl:for-each select="CV/VideoHobby">
    <div class="project" typeof="VideoObject">
        <h2>
            <xsl:for-each select="Lang">
                <span class="lang-content" data-lang-id="{@id}">
                    <xsl:value-of select="normalize-space(.)"/>
                </span>
            </xsl:for-each>
        </h2>

        <span property="author" typeof="Organization">
            <span property="name">
                <xsl:value-of select="@author"/>
            </span>
        </span>

        <div class="video-container">
            <xsl:for-each select="Lang">
                <div class="lang-content" data-lang-id="{@id}">
                    <!-- Extraction de l'ID de la vidéo -->
                    <xsl:variable name="url" select="@URL"/>
                    <xsl:variable name="videoId">
                        <xsl:choose>
                            <xsl:when test="contains($url, 'watch?v=')">
                                <xsl:value-of select="substring-after($url, 'watch?v=')"/>
                            </xsl:when>
                            <xsl:when test="contains($url, 'youtu.be/')">
                                <xsl:value-of select="substring-after($url, 'youtu.be/')"/>
                            </xsl:when>
                            <xsl:when test="contains($url, 'embed/')">
                                <xsl:value-of select="substring-after($url, 'embed/')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$url"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>

                    <!-- Iframe par langue -->
                    <iframe width="560" height="315"
                            src="https://www.youtube.com/embed/{$videoId}"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen="allowfullscreen"
                            property="embedUrl"
                            loading="lazy">
                    </iframe>

                    <!-- Description facultative -->
                    <p property="description">
                        <xsl:value-of select="normalize-space(.)"/>
                    </p>

                    <!-- Lien direct vers la vidéo -->
                    <link property="url" href="{$url}"/>
                </div>
            </xsl:for-each>
        </div>
    </div>
</xsl:for-each>




                </section>
                <footer>
                    <p typeof="Person">
                        <span property="name"><xsl:value-of select="CV/PersonalInfo/Name"/></span> |
                        <span data-lang-en="Contact : " data-lang-fr="Contact : " data-lang-zh="联系方式 : ">Contact : </span>
                        <a property="email" href="mailto:{CV/PersonalInfo/Email}"><xsl:value-of select="CV/PersonalInfo/Email"/></a>
                    </p>
                    <p>
                        <span data-lang-en="For the structured data of this CV:" data-lang-fr="Pour les données structurées de ce CV :" data-lang-zh="此简历的结构化数据 :">Pour les données structurées de ce CV :</span>
                        <br/>
                        <a href="portefolio.xml" target="_blank" rel="noopener noreferrer">
                            <span data-lang-en="XML Version" data-lang-fr="Version XML" data-lang-zh="XML版本">Version XML</span>
                        </a> |
                        <a href="portfolio.rdf" target="_blank" rel="noopener noreferrer">
                            <span data-lang-en="RDF Version" data-lang-fr="Version RDF" data-lang-zh="RDF版本">Version RDF</span>
                        </a> |
                        <a href="cv-schema.rdfs" target="_blank" rel="noopener noreferrer">
                            <span data-lang-en="RDFS Schema" data-lang-fr="Schéma RDFS" data-lang-zh="RDFS模式">Schéma RDFS</span>
                        </a> |
                        <a href="portefolio.xsd" target="_blank" rel="noopener noreferrer">
                            <span data-lang-en="XSD Schema" data-lang-fr="Schéma XSD" data-lang-zh="XSD模式">Schéma XSD</span>
                        </a>
                    </p>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
