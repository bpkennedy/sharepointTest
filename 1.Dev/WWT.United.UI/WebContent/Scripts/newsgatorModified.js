$(document).ready(function () { 


    Type.registerNamespace("NGCustom");
    NGCustom.Events = jQuery(document.createElement("DIV"));
    NGCustom.ColleagueList = null;
    NGCustom.CommunityList = null;
    NGCustom.HashTags = [];
    NGCustom.UserSuggestions = {};
    (function (a, b, d) {
        var c = {
            init: function (e) {
                var b = a.extend({}, a.fn.ngsettings.defaults, e),
                d = a(this).data("options", b);
                return this.each(function () {
                    if (a(b.settingsContainer).length === 0)
                        return;
                    try {
                        if (NGCustom.NM && NGCustom.NM.SubscriptionsAllowed && b.subscriptionsAllowed == null)
                            NGCustom.NM.SubscriptionsAllowed(function (a) {
                                b.subscriptionsAllowed = a;
                                c.show.call(d)
                            });
                        else
                            c.show.call(d)
                    } catch (e) {
                        Sys.Debug.trace("Error checking NewsManager SubscriptionsAllowed");
                        c.show.call(d)
                    }
                })
            },
            show: function () {
                var g = this,
                e = this.data("options"),
                d = a.extend({
                    newsInterestsEndPointUri: "/_layouts/ng/nm/pages/newsinterests.aspx?IsDlg=1&autoclose=0",
                    userSubscriptionsEndPointUri: "/_layouts/ng/nm/pages/usersubscription.aspx?IsDlg=1",
                    sphereEndPointUri: "/_layouts/ng/pages/managegroups.aspx?IsDlg=1",
                    communitiesEndPointUrl: "/_layouts/ngc/communities.aspx?IsDlg=1",
                    newsInterestsContentId: "ngNewsIntegrations",
                    userSubscriptionsContentId: "ngSubscriptions",
                    sphereContentId: "ngSphereFrame",
                    settingsNavContainer: "ngSettingsNav",
                    communitiesContentId: "ngCommunityResults",
                    dialogMinHeight: 700,
                    dialogResize: true,
                    dialogIsModal: true,
                    dialogPosition: "top"
                }, e || {}),
                i = {},
                f = [],
                h,
                k;
                f.push({
                    display: ngText.EventsLink,
                    call: function () {
                        c.renderEventSettings.call(g)
                    }
                });
                f.push({
                    display: ngText.NotificationsLink,
                    call: function () {
                        c.renderNotificationSettings.call(g)
                    }
                });
                if (NGCustom.NM) {
                    f.push({
                        display: ngText.NewsInterestsLink,
                        call: function () {
                            c.renderFrameTab.call(g, {
                                endPointUri: d.newsInterestsEndPointUri,
                                contentId: d.newsInterestsContentId
                            })
                        }
                    });
                    e.subscriptionsAllowed &&
                    f.push({
                        display: ngText.SubscriptionsLink,
                        call: function () {
                            c.renderFrameTab.call(g, {
                                endPointUri: d.userSubscriptionsEndPointUri,
                                contentId: d.userSubscriptionsContentId
                            })
                        }
                    })
                }
                b.ngSpheresEnabled &&
                f.push({
                    display: ngText.SpheresLink,
                    call: function () {
                        c.renderFrameTab.call(g, {
                            endPointUri: d.sphereEndPointUri,
                            contentId: d.sphereContentId
                        })
                    }
                });
                f.push({
                    display: ngText.Communities,
                    call: function () {
                        c.renderFrameTab.call(g, {
                            endPointUri: d.communitiesEndPointUrl,
                            contentId: d.communitiesContentId
                        })
                    }
                });
                i[ngText.CloseVerb] = function () {
                    a(this).dialog("close")
                };
                a("#ngSettings").dialog({
                    minHeight: d.dialogMinHeight,
                    resize: d.dialogResize,
                    width: d.dialogWidth,
                    modal: d.dialogIsModal,
                    dialogClass: "ng-ui-wrapper",
                    position: d.dialogPosition,
                    buttons: i,
                    draggable: false,
                    create: function () {
                        a(e.dialogButtonContainer).empty();
                        a(function () {
                            a(b).resize(function () {
                                $dialog = a(e.parent).parent();
                                if ($dialog.height() > a(b).height())
                                    $dialog.height(a(b).height() * .95);
                                else
                                    $dialog.height("auto");
                                a(e.settingsContainer).css("height", $dialog.height() - a(e.settingsContainer).position().top - 15 - a(".ui-dialog-titlebar", $dialog).height())
                            })
                        })
                    },
                    open: function () {
                        $dialog = a(e.parent).parent();
                        $dialog.height() > a(b).height() &&
                        $dialog.height(a(b).height() * .95);
                        a(e.parent).prepend(a("<ul/>").prop("id", d.settingsNavContainer).css("float", "left"));
                        h = $dialog.find("#" + d.settingsNavContainer);
                        a.each(f, function (c, b) {
                            h.append(a("<li/>").text(b.display))
                        });
                        a(e.settingsContainer).css("height", $dialog.height() - a(e.settingsContainer).position().top - 15 - a(".ui-dialog-titlebar", $dialog).height());
                        h.on("click", "li", function () {
                            var b = a(this),
                            c = a.grep(f, function (a) {
                                return a.display == b.text()
                            })[0];
                            b.parent().find("li").removeClass("active");
                            b.addClass("active");
                            a(e.settingsContainer).html("");
                            c.call();
                            a(e.dialogButtonContainer).empty()
                        });
                        h.find("li").first().trigger("click")
                    },
                    close: function () {
                        a(this).dialog("destroy");
                        a(e.settingsContainer).empty();
                        a("#" + d.settingsNavContainer).remove()
                    }
                })
            },
            renderFrameTab: function (j) {
                var k = this,
                f = this.data("options"),
                c = a.extend({
                    endPointUri: d,
                    contentId: d,
                    title: d,
                    iframeHeight: "500",
                    iframeWidth: "100%",
                    iframeScrolling: "no",
                    iframeBorder: 0
                }, j);
                if (c.endPointUri === d || c.contentId === d)
                    return;
                var g = a("<div/>").prop("id", c.contentId + "Wrapper"),
                i = a("<span/>").addClass("ngLoading").appendTo(g),
                h = a(f.dialogButtonContainer);
                h.find(".tempButton").remove();
                c.title &&
                g.append(a("<h3/>").append(a("<a/>").prop("href", "#").text(c.title)));
                g.append(a("<div/>").append(a("<iframe/>").attr({
                    id: c.contentId,
                    src: b.spWebUrl + c.endPointUri + "&dashboard=1",
                    scrolling: c.iframeScrolling,
                    frameborder: c.iframeBorder,
                    width: c.iframeWidth,
                    height: c.iframeHeight
                })));
                a(f.settingsContainer).empty().append(g);
                var e = a(f.settingsContainer).find("iframe#" + c.contentId);
                e.hide();
                e.ready(function () {
                    e.show();
                    var b = e.contents();
                    e.hide();
                    var d = b.find(".ngButtons").children();
                    d.hide();
                    h.find(".tempButton").remove();
                    a.each(d, function (e, d) {
                        var b = a(d);
                        if (b.prop("id").indexOf("ngCancel") < 0) {
                            var c = a("<button/>", {
                                id: "iframe_" + b.prop("id"),
                                href: "javascript:void(0);",
                                "class": "ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only tempButton",
                                style: "",
                                html: '<span class="ui-button-text">' + b.prop("value") + "</span>",
                                role: "button",
                                "aria-disabled": false
                            }).appendTo(h);
                            c.on("click", function () {
                                b.trigger("click")
                            })
                        }
                    });
                    a("a#lnkFeed, .ngPreview .ngNewsArticles a", b).attr("target", "_blank");
                    var g = a(f.settingsContainer).height() * .98;
                    i.remove();
                    e.height(a(f.settingsContainer).height() * .98).show(400, function () {
                        c.contentId === "ngSphereFrame" &&
                        setTimeout(function () {
                            e.contents().find("#s4-workspace").css({
                                height: g + "px"
                            })
                        }, 1e3)
                    })
                });
                a(b).resize(function () {
                    e.height(a(f.settingsContainer).height() * .98)
                })
            },
            renderEventSettings: function (f) {
                var h = this,
                e = this.data("options"),
                c = a.extend({
                    endPointUri: "_vti_bin/ng/activityfeed.svc/ActivityTypes/",
                    hideActivityTypeUri: "_vti_bin/ng/activityfeed.svc/Hide/",
                    followActivityTypeUri: "_vti_bin/ng/activityfeed.svc/Follow/",
                    eventSettingsContainer: "ngEventSettings",
                    eventGrouping: {
                        communication: {
                            title: ngText.EventGroupingCommunicationTitle,
                            htmlStaging: "<ul/>"
                        },
                        content: {
                            title: ngText.EventGroupingContentTitle,
                            htmlStaging: "<ul/>"
                        },
                        social: {
                            title: ngText.EventGroupingSocialTitle,
                            htmlStaging: "<ul/>"
                        },
                        profile: {
                            title: ngText.EventGroupingProfileTitle,
                            htmlStaging: "<ul/>"
                        },
                        custom: {
                            title: ngText.EventGroupingCustomTitle,
                            htmlStaging: "<ul/>"
                        }
                    },
                    eventList: {
                        NewsGatorV15Microblogging: "communication",
                        StatusMessage: "communication",
                        NoteboardPosts: "communication",
                        NewsGatorV15NewsGatorQA: "communication",
                        NewsGatorV15Blog: "content",
                        BlogUpdate: "content",
                        NewsGatorV15BlogComment: "content",
                        NewsGatorV15Document: "content",
                        NewsGatorV15EditDocument: "content",
                        NewsGatorV15Wiki: "content",
                        NewsGatorV15Picture: "content",
                        NewsGatorV15Task: "content",
                        NewsGatorV15Event: "content",
                        NewsGatorV15Announcements: "content",
                        NewsGatorV15Discussion: "content",
                        NewsGatorV15DiscussionReply: "content",
                        NewsGatorV15Contact: "content",
                        SocialTaggingByColleague: "content",
                        SocialTaggingByAnyone: "content",
                        SocialRatings: "content",
                        NewsGatorV15Link: "content",
                        ColleagueAddition: "social",
                        NewsGatorV15JoinCommunity: "social",
                        ProfilePropertyChange: "profile",
                        Birthday_Today: "profile",
                        Birthday_Reminder: "profile",
                        WorkplaceAnniversary_Reminder: "profile",
                        WorkplaceAnniversary_Today: "profile",
                        TitleChange: "profile",
                        ManagerChange: "profile",
                        DLMembershipChange: "profile",
                        NewsGatorRssModuleRssModule: "custom",
                        SharingInterest: "profile",
                        NewsGatorSpotlightModuleNGBadging: "custom",
                        NewsGatorSpotlightModuleNGKudos: "custom",
                        NewsGatorIdeaModuleIdea: "custom",
                        NewsGatorV15ModerationNotification: "custom",
                        NewsGatorV15SysNotification: "custom",
                        NewsGatorVideoStreamModuleVideoAuthor: "custom",
                        NewsGatorLearningModuleNgKnowledgeBase: "custom",
                        NewsGatorVideoStreamModuleVideo: "custom"
                    }
                }, f),
                g = a("<span/>").addClass("ngLoading").appendTo(a(e.settingsContainer));
                a.ajax({
                    type: "GET",
                    contentType: "application/json; charset=utf-8",
                    url: String.format("{0}/" + c.endPointUri, b.spWebUrl),
                    success: function (h) {
                        a(e.settingsContainer).empty().append(a("<div/>").prop("id", c.eventSettingsContainer).addClass("accordion"));
                        var g = a("#" + c.eventSettingsContainer);
                        if (h.length > 0) {
                            $settingsContent = a("<ul>");
                            a.each(h, function (i, b) {
                                var g,
                                h,
                                e = c.eventList[b.Name],
                                f = a("<li>").append(a("<input>").attr({
                                    type: "checkbox",
                                    name: "ngSetting_" + b.Id,
                                    id: b.Name + "_" + b.Id
                                }).addClass("chk ngNotificationSetting")).append(a("<label>").append(b.DisplayName));
                                b.IsFollowing &&
                                f.find("input#" + b.Name + "_" + b.Id).attr("checked", "checked");
                                if (e === d)
                                    $settingsContent.append(f);
                                else
                                    c.eventGrouping[e].htmlStaging = a(c.eventGrouping[e].htmlStaging).append(f)
                            })
                        } else
                            $settingsContent = a('<div class="ngAlertContainer">' + ngText.EventNoSettingsAvailable + "</div>");
                        a.each(c.eventGrouping, function (c, b) {
                            g.append(a("<h3/>").text(b.title).addClass("head").append(a("<span/>").addClass("spriteStream")));
                            g.append(b.htmlStaging)
                        });
                        g.append($settingsContent);
                        var f = a(e.settingsContainer).find(".accordion h3");
                        f.click(function () {
                            f.filter(".down").removeClass("down").next().toggle();
                            a(this).addClass("down").next().toggle();
                            return false
                        }).next().hide();
                        f.first().trigger("click");
                        a(e.settingsContainer).find("input").change(function () {
                            var d = a(this),
                            f = d.prop("name").replace("ngSetting_", ""),
                            e;
                            if (d.is(":checked"))
                                e = c.followActivityTypeUri;
                            else
                                e = c.hideActivityTypeUri;
                            a.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: String.format("{0}/{1}{2}/", b.spWebUrl, e, f),
                                success: function () {
                                    d.parent().find("label").animate({
                                        color: "Green",
                                        duration: "800"
                                    }).delay(1e3).animate({
                                        color: "#00000",
                                        duration: "800"
                                    })
                                },
                                error: function () {
                                    d.parent().find("label").append('<span class="ngSettings-error">' + ngText.ErrorSavingChanges + "</span>").find("span").fadeOut(4e3)
                                }
                            })
                        })
                    },
                    error: function (a) {
                        alert(NGCustom.GetDefaultErrorMessage(a.status))
                    }
                })
            },
            renderNotificationSettings: function (t) {
                var z = this,
                l = this.data("options"),
                d = a.extend({
                    endPointUri: "_vti_bin/ng/eventnotification.svc/Settings/",
                    groupEndPointUri: "_vti_bin/ng/eventnotification.svc/Settings/Groups/",
                    digestEndPointUri: "_vti_bin/ng/userprofile.svc/Settings/Digest/",
                    contentWrapper: "ngSettingsNotifications"
                }, t),
                y = a("<span/>").addClass("ngLoading").appendTo(a(l.settingsContainer)),
                u,
                v,
                x,
                w = false,
                c = a('<div id="' + d.contentWrapper + '">'),
                k = a("<ul/>").addClass("ngTabs");
                a("<li/>").prop({
                    id: "ngTabDigest",
                    "class": "head",
                    ngTabContent: "#ngDigest"
                }).text(ngText.TabDigestVerb).appendTo(k);
                a("<li/>").prop({
                    id: "ngTabNotifyAbout",
                    "class": "head",
                    ngTabContent: "#ngInstant"
                }).text(ngText.TabNotifyAboutVerb).appendTo(k);
                var e = a("<div/>").prop({
                    id: "ngDigest",
                    "class": "ngTabContent"
                }).hide(),
                q = a("<ul>").appendTo(e.append(a("<span/>").text(ngText.DigestOnOffVerb))),
                n = a("<div />").appendTo(e.append(a("<span/>").text(ngText.DigestWhenVerb))),
                m = a("<ul>").appendTo(e.append(a("<span/>").text(ngText.DigestWhatVerb))),
                h = a("<ul>").appendTo(e.append(a("<span/>").text(ngText.DigestFormatVerb))),
                j = a("<div/>").prop({
                    id: "ngInstant",
                    "class": "ngTabContent accordion"
                }).hide(),
                o = a("<ul>").appendTo(j.append(a("<span/>").text(ngText.DigestOnOffVerb))),
                g = j.append(a("<span/>").text(ngText.DigestWhatVerb)),
                f = a("<ul/>").prop({
                    id: "ngCommunitySpheres",
                    "class": "subhead"
                }),
                p = a.ajax({
                    type: "GET",
                    contentType: "application/json; charset=utf-8",
                    url: String.format("{0}/{1}", b.spWebUrl, d.endPointUri),
                    success: function (d) {
                        var e = [];
                        a.each(d, function (d, b) {
                            if (b.Id === "00000000-0000-0000-0000-000000000000")
                                a.each(b.Settings, function (c, b) {
                                    checkbox = a("<input>").attr({
                                        type: "checkbox",
                                        name: "ngSetting_" + b.InternalName
                                    }).addClass("chk ngNotificationSetting");
                                    b.Enabled &&
                                    checkbox.attr("checked", "checked");
                                    if (b.InternalName == "NGReceiveDigestEmail")
                                        a("<li/>").append(checkbox).append(a("<label>").append(b.DisplayName)).appendTo(q);
                                    else
                                        a("<li/>").append(checkbox).append(a("<label>").append(b.DisplayName)).appendTo(o)
                                });
                            else {
                                g.append(a("<h3>").text(b.DisplayName).addClass("head subhead").append(a("<span/>").addClass("spriteStream")));
                                var c = a("<ul/>").addClass("subhead");
                                a.each(b.Settings, function (d, b) {
                                    checkbox = a("<input>").attr({
                                        type: "checkbox",
                                        name: "ngSetting_" + b.InternalName
                                    }).addClass("chk ngNotificationSetting");
                                    b.Enabled &&
                                    checkbox.attr("checked", "checked");
                                    c.append(a("<li/>").append(checkbox).append(a("<label>").append(b.DisplayName)).append("<br/>"))
                                });
                                g.append(c)
                            }
                        });
                        c.append(j);
                        c.not("#ngCommunitySpheres").find("input.ngNotificationSetting").change(function () {
                            var c = a(this),
                            e = c.prop("name").replace("ngSetting_", ""),
                            d = String.format("{0}/{1}{2}/?enable={3}", b.spWebUrl, "_vti_bin/ng/eventnotification.svc/Settings/", e, c.is(":checked").toString());
                            a.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: d,
                                success: function () { },
                                error: function (a) {
                                    alert(NGCustom.GetDefaultErrorMessage(a.status))
                                }
                            })
                        })
                    },
                    error: function () { }

                }),
                s = a.ajax({
                    type: "GET",
                    contentType: "application/json; charset=utf-8",
                    url: String.format("{0}/{1}", b.spWebUrl, d.groupEndPointUri),
                    success: function (h) {
                        if (h.length > 0) {
                            var c = [],
                            g = a("<table/>").appendTo(f),
                            d = a("<tr/>").appendTo(a("<thead />"));
                            d.appendTo(g);
                            var e = a("<tbody/>");
                            g.append(e);
                            d.append(a("<th/>").text(ngText.NameVerb));
                            a.each(h, function (h, f) {
                                var b = a("<tr/>");
                                e.append(b);
                                b.append(a("<td/>").text(f.DisplayName));
                                for (var g = 0; g < c.length; ++g)
                                    b.append(a("<td/>"));
                                a.each(f.Settings, function (i, f) {
                                    var g = a.inArray(f.DisplayName, c);
                                    if (g == -1) {
                                        c.push(f.DisplayName);
                                        g = a.inArray(f.DisplayName, c);
                                        d.append(a("<th/>").text(f.DisplayName));
                                        e.find("tr").append(a("<td/>"))
                                    }
                                    var h = a(b[0].cells[g + 1]);
                                    checkbox = a("<input>").attr({
                                        type: "checkbox",
                                        name: "ngSetting_" + f.InternalName
                                    }).addClass("chk");
                                    f.Enabled &&
                                    checkbox.attr("checked", "checked");
                                    h.attr("DiaplayName", f.DisplayName).append(checkbox)
                                })
                            });
                            f.find("input").change(function () {
                                var c = a(this),
                                e = c.prop("name").replace("ngSetting_", ""),
                                d = String.format("{0}/{1}{2}", b.spWebUrl, e, c.is(":checked") ? "" : "x/");
                                a.ajax({
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: d,
                                    success: function () { },
                                    error: function (a) {
                                        alert(NGCustom.GetDefaultErrorMessage(a.status))
                                    }
                                })
                            })
                        } else
                            a('<li class="ngNoMaxWidth">' + ngText.NoCommunitiesMessage + "</li>").appendTo(f)
                    },
                    error: function () { }

                }),
                r = a.ajax({
                    type: "GET",
                    contentType: "application/json; charset=utf-8",
                    url: String.format("{0}/{1}", b.spWebUrl, d.digestEndPointUri),
                    success: function (g) {
                        a.each(g.DigestSections, function (c, b) {
                            checkbox = a("<input>").attr({
                                type: "checkbox",
                                name: "ngDigestSetting_" + b.InternalName
                            }).addClass("chk");
                            b.Enabled &&
                            checkbox.attr("checked", "checked");
                            a("<li/>").append(checkbox).append(a("<label>").append(b.DisplayName)).appendTo(m)
                        });
                        m.find("input").change(function () {
                            var c = a(this),
                            f = c.prop("name").replace("ngDigestSetting_", ""),
                            e = String.format("{0}/{1}Section/{2}/{3}/", b.spWebUrl, d.digestEndPointUri, f, c.is(":checked") ? "Add" : "Remove");
                            a.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: e,
                                success: function () { },
                                error: function (a) {
                                    alert(NGCustom.GetDefaultErrorMessage(a.status))
                                }
                            })
                        });
                        var j = a('<input type="radio" name="ngDigestSettingGroupSections" />').attr({
                            value: "false"
                        });
                        a("<li/>").addClass("radio").append(j).append(a("<label>").append(ngText.DigestFormatChronological)).appendTo(h);
                        var k = a('<input type="radio" name="ngDigestSettingGroupSections" />').attr({
                            value: "true"
                        });
                        a("<li/>").addClass("radio").append(k).append(a("<label>").append(ngText.DigestFormatGroup)).appendTo(h);
                        if (g.DisplayGrouped)
                            k.attr("checked", "checked");
                        else
                            j.attr("checked", "checked");
                        h.find(":radio").change(function () {
                            var e = a(this),
                            c = String.format("{0}/{1}GroupSections/{2}/", b.spWebUrl, d.digestEndPointUri, e.attr("value"));
                            a.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: c,
                                success: function () { },
                                error: function (a) {
                                    alert(NGCustom.GetDefaultErrorMessage(a.status))
                                }
                            })
                        });
                        try {
                            var l = g.SendTime.split(":"),
                            f = new Date;
                            f.setUTCHours(l[0]);
                            var e = new Date;
                            e.setHours(0);
                            var c = a('<select data-placeholder="' + ngText.DigestSendTimePlaceholder + '" id="ngDigestSendTime" class="chosendelay" />');
                            a("<option>").prop({
                                value: e.getUTCHours() + ":00",
                                selected: 0 == f.getHours()
                            }).text("midnight").appendTo(c);
                            for (i = 1; i < 24; ++i) {
                                e.setHours(i);
                                a("<option>").prop({
                                    value: e.getUTCHours() + ":00",
                                    selected: i == f.getHours()
                                }).text(i + ":00").appendTo(c)
                            }
                            c.appendTo(n);
                            c.change(function () {
                                var e = a(this),
                                c = String.format("{0}/{1}Schedule/?timeUTC={2}", b.spWebUrl, d.digestEndPointUri, encodeURIComponent(e.attr("value")));
                                a.ajax({
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: c,
                                    success: function () { },
                                    error: function (a) {
                                        alert(NGCustom.GetDefaultErrorMessage(a.status))
                                    }
                                })
                            })
                        } catch (o) { }
                    },
                    error: function () { }

                });
                c.append(k).append(e);
                a.when(p, s, r).done(function () {
                    a("<h3 />").addClass("head subhead").text(ngText.CommunitySpheresTitle).append(a("<span/>").addClass("spriteStream")).appendTo(g);
                    g.append(f);
                    c.find(".ngTabs li").unbind("click").on("click", function (d) {
                        a(this).parent().children().removeClass("active");
                        a(this).addClass("active");
                        c.find("h3.head").filter(".down").removeClass("down").next().toggle();
                        c.find(".ngTabContent").hide().filter(a(this).prop("ngTabContent")).show();
                        var b = a(a(this).prop("ngTabContent")).find("h3.head");
                        b.unbind("click").on("click", function (c) {
                            if (!a(this).hasClass("down")) {
                                b.filter(".down").removeClass("down").next().toggle();
                                a(this).addClass("down").next().toggle()
                            } else
                                a(this).removeClass("down").next().toggle();
                            c.preventDefault()
                        }).next().hide();
                        b.first().trigger("click");
                        d.preventDefault()
                    }).first().trigger("click");
                    a(l.settingsContainer).empty().append(c);
                    a().chosen &&
                    a("#ngDigestSendTime").chosen({
                        disable_search_threshold: 9999
                    });
                    a(l.settingsContainer).find('input[name="ngSetting_notification_emails"]').change(function () {
                        var b = a(this);
                        b.parent().find("div").first().show()
                    })
                })
            }
        };
        a.fn.ngsettings = function (b) {
            if (c[b])
                return c[b].apply(this, Array.prototype.slice.call(arguments, 1));
            else
                if (typeof b === "object" || !b)
                    return c.init.apply(this, arguments);
                else
                    a.error("Method " + b + " does not exist on jQuery.NGCustom.Settings")
        };
        a.fn.ngsettings.defaults = {
            parent: "#ngSettings",
            settingsContainer: "#ngSettingsContainer",
            dialogButtonContainer: ".ui-dialog-buttonset",
            spWebUrl: b.spWebUrl,
            subscriptionsAllowed: null,
            dialogWidth: 700
        }
    })(jQuery, window);

});