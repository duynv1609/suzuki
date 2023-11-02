/*
 * This file is a part of Suzuki Membership Platform which is privately-owned by Vietnam Suzuki Corporation and for internal use only.
 * @package Suzuki Membership Platform
 * @copyright 2021. Vietnam Suzuki Corporation (VISUCO)
 * @author Nguyen Tran Duy Phuong <phuongntd@vietnamsuzuki.com.vn>
 * @link https://suzuki.com.vn
 */

var Mko = {};

Mko.Util = {};

Mko.Util.getParameter = function (name, url) {
    if (url == undefined || url == null)
        url = window.location.search;
    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regexS = "[\\?&]" + name + "=([^&#]*)";
    var regex = new RegExp(regexS);
    var results = regex.exec(url);
    if (results == null)
        return "";
    else
        return decodeURIComponent(results[1].replace(/\+/g, " "));
};

Mko.Util.getLogoTitle = function () {
    var title = document.title;
    $('#logo').attr('title', title);
}

$(document).ready(function () {
    Xem.Framework.preventDuplicateSubmits();
    Xem.Framework.registerMessageCloseButton();
    Xem.Framework.fixWhenScroll();
    //Mko.Util.getLogoTitle();
});

function setCookie(name, value, expires, path, domain) {
    var cookie = name + '=' + escape(value) + ';';

    if (expires) {
        cookie += 'max-age=' + expires*60*60*24 + ';';

        if (path) {
            cookie += 'path=' + path + ';';
        }
        if (domain) {
            cookie += 'domain=' + domain + ';';
        }
    }
    document.cookie = cookie;
}

function getCookie(name) {
    var regexp = new RegExp(name + "=([^;]+)");
    var result = regexp.exec(document.cookie);
    return (result === null) ? null : result[1];
}

function getToday() {
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();

    if(dd<10) {
        dd='0'+dd
    }

    if(mm<10) {
        mm='0'+mm
    }
    today = yyyy+'-'+mm+'-'+dd;
    return today;
}

var Xem = {
    authenticated: false
};

Xem.GA = {};

var _gaq;

Xem.GA.init = function (account) {
    _gaq = _gaq || [];
    _gaq.push(['_setAccount', account]);
    _gaq.push(['_trackPageview']);

    (function () {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
};

Xem.Facebook = {
    appId: null,
    preInit: null,
    postInit: null
};

Xem.Facebook.init = function (appId) {
    Xem.Facebook.appId = appId;
    var isInit = false;
    window.fbAsyncInit = function() {
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.async = true;
            js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=" + appId;
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
        FB.Event.subscribe('xfbml.render', function(response) {
            $('.fb-share-btn-list').each(function() {
                $(this).removeClass('invisible');
            });
        });
        isInit = true;
    };
    if(!isInit) {
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.async = true;
            js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=" + appId;
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    }
    /*if (!Xem.authenticated && $.cookie('tlogin') === undefined) {
        var exists = window.fbAsyncInit;
        window.fbAsyncInit = function () {
            if (exists) {
                exists.apply(this);
            }
            FB.getLoginStatus(function (response) {
                if (response.status === 'connected') {
                    var accessToken = response.authResponse.accessToken;
                    var signedRequest = response.authResponse.signedRequest;
                    $.post('/account/loginsilent', { signedRequest: signedRequest, accessToken: accessToken });
                }
            });
        };
    }*/
};

Xem.Framework = {};

Xem.Framework.fixWhenScroll = function () {
    if($('.rightPage').length) {
        var defaultTop = $('.rightPage').offset().top;
    }
    $(window).scroll(function () {
        var s = $(window).scrollTop();
        $(".fixedScrollDetector").each(function () {
            var detector = $(this);
            var fixedContent = detector.next();
            var fixTop = 50;
            if (detector.attr("data-fixedTop") !== undefined)
                fixTop = detector.attr("data-fixedTop");
            if (detector.offset().top - fixTop <= s) {
                fixedContent.css({ position: "fixed", top: fixTop + "px" });
            } else {
                fixedContent.css({ position: "relative", top: "" });
            }
        });
        if($('.rightPage').length) {
            var screen = $( window ).height();
            var boxHeight = $('.rightPage').height();
            var top = $('.rightPage').offset().top;
            if(screen > boxHeight) {
                if(top - 50 <= s && top > defaultTop) {
                    $('.rightPage').css({ position: "fixed", top: "50px"});
                }
                else {
                    $('.rightPage').css({ position: "relative", top: "" });
                }
            }
            else {
                if(s - defaultTop > 150 && s - screen + top - boxHeight > 10) {
                    $('.rightPage').css({ position: "fixed", bottom: "10px"});
                }
                else {
                    $('.rightPage').css({ position: "relative", bottom: "" });
                }
            }
        }
    });
};

Xem.Framework.preventDuplicateSubmits = function () {
    $(".submitForm").submit(function () {
        if ($(this).valid()) {
            $('.submitButton').attr("disabled", "disabled");
        }
    });
};

Xem.Framework.registerMessageCloseButton = function () {
    $(".close").click(function () {
        $(this).parent().fadeTo(200, 0, function () {
            $(this).slideUp(300);
        });
        return false;
    });
};

Xem.Reporting = {
    reportingId: null
};

Xem.Reporting.handleReports = function (allowDuplicateWindow) {
    //report
    var reportWindowOption = {
        maxWidth: 800,
        maxHeight: 600,
        width: '500px',
        height: '280px',
        autoSize: false,
        openEffect: 'none',
        closeEffect: 'none',
        closeBtn: false
    };
    $("a[data-action=report]").live('click', function (e) {
        e.preventDefault();
        Xem.Reporting.id = $(this).data('id');
        if (!Xem.authenticated) {
            window.location.href = "/account/login?returnUrl=" + document.location.pathname + document.location.search;
            return;
        }
        $('#reportFreeText, #reportDdl').val('');
        $.fancybox.open("#reportPhotoContainer", reportWindowOption);
    });

    $("a[data-action=report-video]").live('click', function (e) {
        e.preventDefault();
        Xem.Reporting.id = $(this).data('id');
        if (!Xem.authenticated) {
            window.location.href = "/account/login?returnUrl=" + document.location.pathname + document.location.search;
            return;
        }
        $('#reportFreeText, #reportVideoDdl').val('');
        $.fancybox.open("#reportVideoContainer", reportWindowOption);
    });

    if (Mko.Util.getParameter("report") == "1" && Xem.authenticated) {
        //auto report only for details page
        Xem.Reporting.id = Xem.PhotoDetails.photoId;
        if (Xem.Reporting.id) {
            $.fancybox.open("#reportPhotoContainer", reportWindowOption);
        }
    }
    $("#reportPhotoContainer .submitButton").click(function () {
        var reason = $.trim($("#reportFreeText").val());
        if (reason == "")
            reason = $("#reportDdl").val();
        $.fancybox.close();
        $.post("/photos/report", { photoId: Xem.Reporting.id, reason: reason });
        alert("Cảm ơn bạn đã báo cáo hình ảnh này. BQT sẽ xử lý trong thời gian sớm nhất.");
    });

    $("#reportVideoContainer .submitButton").click(function () {
        var reason = $.trim($("#reportFreeText").val());
        if (reason == "")
            reason = $("#reportVideoDdl").val();
        $.fancybox.close();
        $.post("/video/report", { videoId: Xem.Reporting.id, reason: reason });
        alert("Cảm ơn bạn đã báo cáo. BQT sẽ xử lý trong thời gian sớm nhất.");
    });

    $('a[data-action=duplicate]').live('click', function (e) {
        e.preventDefault();
        var $this = $(this);
        Xem.ListPhoto.vote($this.data('id'), false, false);
        $this.html('Cảm ơn bạn đã báo cáo!').contents().unwrap();
    });

    $('a[data-action=duplicate-video]').live('click', function (e) {
        e.preventDefault();
        var $this = $(this);
        Xem.ListVideo.vote($this.data('id'), false, false);
        $this.html('Cảm ơn bạn đã báo cáo!').contents().unwrap();
    });

    if (allowDuplicateWindow) {
        //report duplicate
        var duplicateOption = {
            maxWidth: 800,
            maxHeight: 600,
            width: '500px',
            height: '220px',
            autoSize: false,
            openEffect: 'none',
            closeEffect: 'none',
            closeBtn: false
        };
        $('a[data-action=report-duplicate]').live('click', function (e) {
            e.preventDefault();
            Xem.Reporting.id = $(this).data('id');
            if (!Xem.authenticated) {
                window.open('/account/login?returnUrl=/photo/' + Xem.Reporting.id + '?duplicate=1', '_self');
                return;
            }
            $('#reportDuplicateFreeText').val('');
            $.fancybox.open("#reportDuplicateContainer", duplicateOption);
        });
        if (Mko.Util.getParameter("duplicate") == "1" && Xem.authenticated) {
            //auto report only for details page
            Xem.Reporting.id = Xem.PhotoDetails.photoId;
            if (Xem.Reporting.id) {
                $.fancybox.open("#reportDuplicateContainer", duplicateOption);
            }
        }
        $("#reportDuplicateContainer .submitButton").click(function () {
            var url = $.trim($("#reportDuplicateFreeText").val());
            $.fancybox.close();
            $.post("/photos/duplicate", { photoId: Xem.Reporting.id, url: url });
            alert("Cảm ơn bạn đã báo cáo hình ảnh này. BQT sẽ xử lý trong thời gian sớm nhất.");
        });
    }
};

Xem.ListVideo = {
    isLoading: false,
    page: 1,
    initPage: 1,
    hasNoMore: false,
    sort: null,
    voteSort: null,
    topContributorSort: null
};

Xem.ListVideo.init = function (sort) {
    Xem.ListVideo.registerVoteVideoButtonClick();
    Xem.ListVideo.handleReports(true);
    Xem.ListVideo.registerHideClick();

    var exists = window.fbAsyncInit;
    window.fbAsyncInit = function () {
        if (exists) {
            exists.apply(this);
        }
        FB.Event.subscribe('edge.create', Xem.ListVideo.recount);
        FB.Event.subscribe('edge.remove', Xem.ListVideo.recount);
    };
}
Xem.VideoDetails = {
    videoId: null
};

Xem.VideoDetails.init = function (videoId, isMobile) {
    Xem.VideoDetails.videoId = videoId;
    Xem.ListVideo.handleReports(true);
    Xem.VideoDetails.registerDeleteClick();
    Xem.VideoDetails.registerHideClick();
    Xem.ListVideo.registerVoteVideoButtonClick();
    Xem.VideoDetails.registerFavoriteClick();
    Xem.VideoDetails.registerStaffDeleteClick();

    var rand = Math.floor((Math.random() * 10000000000) + 1);
    $.get("/video/iv/"+videoId, { hash:rand});

    var exists = window.fbAsyncInit;
    window.fbAsyncInit = function () {
        if (exists) {
            exists.apply(this);
        }
        if (typeof (Xem.Facebook.preInit) == 'function') {
            Xem.Facebook.preInit();
        }
        FB.Event.subscribe('comment.create', Xem.VideoDetails.recount);
        FB.Event.subscribe('comment.remove', Xem.VideoDetails.recount);
        FB.Event.subscribe('edge.create', Xem.VideoDetails.recount);
        FB.Event.subscribe('edge.remove', Xem.VideoDetails.recount);

        if (typeof (Xem.Facebook.postInit) == 'function') {
            Xem.Facebook.postInit();
        }
    };
}
Xem.ListVideo.handleReports = function (allowDuplicateWindow) {
    //report video
    var reportWindowOption = {
        maxWidth: 800,
        maxHeight: 600,
        width: '500px',
        height: '280px',
        autoSize: false,
        openEffect: 'none',
        closeEffect: 'none',
        closeBtn: false
    };
    $("a[data-action=report]").live('click', function (e) {
        e.preventDefault();
        Xem.Reporting.id = $(this).data('id');
        if (!Xem.authenticated) {
            window.location.href = "/account/login?returnUrl=" + document.location.pathname + document.location.search;
            return;
        }
        $('#reportFreeText, #reportDdl').val('');
        $.fancybox.open("#reportVideoContainer", reportWindowOption);
    });
    if (Mko.Util.getParameter("report") == "1" && Xem.authenticated) {
        //auto report only for details page
        Xem.Reporting.id = Xem.VideoDetails.photoId;
        if (Xem.Reporting.id) {
            $.fancybox.open("#reportVideoContainer", reportWindowOption);
        }
    }
    $("#reportVideoContainer .submitButton").click(function () {
        var reason = $.trim($("#reportFreeText").val());
        if (reason == "")
            reason = $("#reportDdl").val();
        $.fancybox.close();
        $.post("/video/report", { videoId: Xem.Reporting.id, reason: reason });
        alert("Cảm ơn bạn đã báo cáo video này. BQT sẽ xử lý trong thời gian sớm nhất.");
    });

    $('a[data-action=duplicate]').live('click', function (e) {
        e.preventDefault();
        var $this = $(this);
        Xem.ListVideo.vote($this.data('id'), false, false);
        $this.html('Cảm ơn bạn đã báo cáo!').contents().unwrap();
    });

    if (allowDuplicateWindow) {
        //report duplicate
        var duplicateOption = {
            maxWidth: 800,
            maxHeight: 600,
            width: '500px',
            height: '220px',
            autoSize: false,
            openEffect: 'none',
            closeEffect: 'none',
            closeBtn: false
        };
        $('a[data-action=report-duplicate]').live('click', function (e) {
            e.preventDefault();
            Xem.Reporting.id = $(this).data('id');
            if (!Xem.authenticated) {
                window.open('/account/login?returnUrl=/video/' + Xem.Reporting.id + '?duplicate=1', '_self');
                return;
            }
            $('#reportDuplicateFreeText').val('');
            $.fancybox.open("#reportDuplicateContainer", duplicateOption);
        });
        if (Mko.Util.getParameter("duplicate") == "1" && Xem.authenticated) {
            //auto report only for details page
            Xem.Reporting.id = Xem.VideoDetails.photoId;
            if (Xem.Reporting.id) {
                $.fancybox.open("#reportDuplicateContainer", duplicateOption);
            }
        }
        $("#reportDuplicateContainer .submitButton").click(function () {
            var url = $.trim($("#reportDuplicateFreeText").val());
            $.fancybox.close();
            $.post("/video/duplicate", { videoId: Xem.Reporting.id, url: url });
            alert("Cảm ơn bạn đã báo cáo hình ảnh này. BQT sẽ xử lý trong thời gian sớm nhất.");
        });
    }
};

Xem.ListPhoto = {
    isLoading: false,
    page: 1,
    initPage: 1,
    hasNoMore: false,
    sort: null,
    voteSort: null,
    topContributorSort: null
};

Xem.ListPhoto.init = function (sort, page, voteSort) {
    Xem.ListPhoto.sort = sort;
    Xem.ListPhoto.page = page;
    Xem.ListPhoto.initPage = page;
    Xem.ListPhoto.voteSort = voteSort;
    if (voteSort == "midnight" || voteSort == "waiting")
        Xem.ListPhoto.hasNoMore = true;

    $(document).ready(function () {
        Xem.ListPhoto.topContributorSort = $(".topUsersSortHome a.selected").attr("data-sort");
        if (Xem.ListPhoto.sort != "vote") {
            Xem.ListPhoto.showTip();
            //Xem.ListPhoto.initExtPopup();
            //Xem.ListPhoto.initFacebookPopup();
        } else {
            Xem.Reporting.handleReports(false);
            Xem.ListVideo.registerVoteVideoButtonClick();
            Xem.VideoDetails.registerHideClick();
        }

        Xem.ListPhoto.registerVoteButtonClick();
        Xem.ListPhoto.registerTopContributorSortClick();
        Xem.ListPhoto.registerHotkeys();
        Xem.ListPhoto.registerHideClick();
        //if(sort != 'uncensored') {
        $(window).scroll(function () {
            Xem.ListPhoto.loadMore();
            Xem.ListPhoto.fixInfoPanel();
        });
        //}
    });
    var exists = window.fbAsyncInit;
    window.fbAsyncInit = function () {
        if (exists) {
            exists.apply(this);
        }
        FB.Event.subscribe('edge.create', Xem.ListPhoto.recount);
        FB.Event.subscribe('edge.remove', Xem.ListPhoto.recount);
    };
};

Xem.ListVideo.registerVoteVideoButtonClick = function () {
    $(".voteVideoButton").live("click", function (e) {
        e.preventDefault();

        var isUpvote = $(this).attr("data-upvote");
        var photoId = $(this).attr("data-id");

        if ($(this).hasClass("upVoted") || $(this).hasClass("downVoted")) { // Already vote, now remove
            $(this).removeClass("upVoted downVoted");
            Xem.ListVideo.vote(photoId, isUpvote, true);
        } else {
            $(".voteVideoButton", $(this).parents(".vote")).removeClass("upVoted downVoted");
            if (isUpvote == "true")
                $(this).addClass("upVoted");
            else
                $(this).addClass("downVoted");
            Xem.ListVideo.vote(photoId, isUpvote, false);
        }
    });
};

Xem.VideoDetails.registerHideClick = function () {
    $("#hideVideo").live('click', function (e) {
        e.preventDefault();
        var a = $(this);
        $.post('/video/hide', { id: a.attr('data-id') }, function (data) {
            if (data.success) {
                a.html("Hidden");
            } else {
                a.html(data.Message);
            }
            a.addClass("disabled");
        });
    });
};

Xem.ListPhoto.initExtPopup = function () {
    var isChrome = navigator.userAgent && navigator.userAgent.toLowerCase().indexOf('chrome') >= 0;
    var noCookies = $.cookie('AskCrx') === undefined && $.cookie('Crx') === undefined;
    if (isChrome && noCookies) {
        $.cookie('AskCrx', '1', { expires: 7 });
        window.openedPopup = true;
        setTimeout(function () {
            var installExtWindowOption = {
                width: '400px',
                height: '380px',
                autoSize: false,
                closeEffect: 'none',
                closeBtn: true,
                topRatio: 0.3,
                helpers: { overlay: { closeClick: false } }
            };
            $.fancybox.open("#installExtContainer", installExtWindowOption);
        }, 2000);
    }
};

Xem.ListPhoto.initFacebookPopup = function () {
    if (!window.openedPopup && $.cookie('gfb') === undefined) {
        var callback = function () {
            $.cookie('gfb', '1', { expires: 3 });
            $.fancybox.open("#guideFacebookContainer", { maxWidth: '400px', closeEffect: 'none', helpers: { overlay: { closeClick: false } } });
        };
        var timer = setTimeout(function () {
            callback();
        }, 7000);
        var img = document.createElement("img");
        img.onload = function () {
            clearTimeout(timer);
        };
        img.src = 'https://www.facebook.com/favicon.ico';
    }
};

Xem.ListPhoto.showTip = function () {
    var tips = [
        "Hãy giúp <b>xem.vn <a href='/vote'>bình chọn ảnh</a></b> để nhiều ảnh hay xuất hiện ở đây hơn",
        "<b>Bình luận</b> có thể gây cười hơn chính bức ảnh đó!",
        "Gặp bài hay hãy <b>\"like\"</b> động viên tác giả nhé!",
        "Bổ sung <b>website</b> vào <b><a href='/account/edit'>thông tin cá nhân</a></b> để PR cho website của bạn!",
        "<b>Ấn hotkey</b> ← và → hoặc Z và X để duyệt ảnh nhanh hơn",
        "Hãy giúp xem.vn báo cáo vi phạm những hình ảnh phản cảm",
        //"<a href='/cach-vao-facebook-bi-chan-mang-vnpt-viettel-fpt'>Đăng nhập vào Facebook</a> để duyệt xem.vn sướng hơn!",
        "Ai cũng có thể đăng ảnh lên xem.vn. Thử <a href='/upload'>upload ngay!</a>"];
    var i = Math.floor((Math.random() * tips.length));
    $(".tips").html("<b>Mẹo: </b>" + tips[i]);
};

Xem.ListPhoto.registerVoteButtonClick = function () {
    $(".voteButton").live("click", function (e) {
        e.preventDefault();

        var isUpvote = $(this).attr("data-upvote");
        var photoId = $(this).attr("data-id");

        if ($(this).hasClass("upVoted") || $(this).hasClass("downVoted")) { // Already vote, now remove
            $(this).removeClass("upVoted downVoted");
            Xem.ListPhoto.vote(photoId, isUpvote, true);
        } else {
            $(".voteButton", $(this).parents(".vote")).removeClass("upVoted downVoted");
            if (isUpvote == "true")
                $(this).addClass("upVoted");
            else
                $(this).addClass("downVoted");
            Xem.ListPhoto.vote(photoId, isUpvote, false);
        }
    });
};


Xem.ListVideo.registerVoteVideoButtonClick = function () {
    $(".voteVideoButton").live("click", function (e) {
        e.preventDefault();

        var isUpvote = $(this).attr("data-upvote");
        var photoId = $(this).attr("data-id");

        if ($(this).hasClass("upVoted") || $(this).hasClass("downVoted")) { // Already vote, now remove
            $(this).removeClass("upVoted downVoted");
            Xem.ListVideo.vote(photoId, isUpvote, true);
        } else {
            $(".voteVideoButton", $(this).parents(".vote")).removeClass("upVoted downVoted");
            if (isUpvote == "true")
                $(this).addClass("upVoted");
            else
                $(this).addClass("downVoted");
            Xem.ListVideo.vote(photoId, isUpvote, false);
        }
    });
};

Xem.ListPhoto.vote = function (photoId, isUpVote, isUnvote) {
    $.post("/photos/vote", {
        photoId: photoId,
        isUpVote: isUpVote,
        isUnvote: isUnvote
    }, function (data) {
        if (data == "Unauthenticated") {
            window.location.href = "/account/login?returnUrl=" + document.location.pathname + document.location.search;
        } else {

        }
    });
};

Xem.ListVideo.vote = function (videoId, isUpVote, isUnvote) {
    $.post("/video/voteVideo", {
        videoId: videoId,
        isUpVote: isUpVote,
        isUnvote: isUnvote
    }, function (data) {
        if (data == "Unauthenticated") {
            window.location.href = "/account/login?returnUrl=/video/vote";
        } else {

        }
    });
};

Xem.ListPhoto.recount = function (response) {
    if (response.toString().indexOf('/photo/') > 0)
        $.post("/photos/countbyurl?url=" + response);
    if (response.toString().indexOf('/video/') > 0)
        $.post("/video/countbyurl?url=" + response);
};

Xem.ListVideo.recount = function (response) {
    if (response.toString().indexOf('/video/') > 0)
        $.post("/video/countbyurl?url=" + response);
};

Xem.ListPhoto.loadMore = function () {
    if ($(window).scrollTop() + $(window).height() >= $(document).height() - 300) {
        if (Xem.ListPhoto.isLoading || Xem.ListPhoto.hasNoMore)
            return;

        Xem.ListPhoto.isLoading = true;
        $(".loading").show();
        $.ajax({
            url: Xem.ListPhoto.sort == "vote" ||  Xem.ListPhoto.sort == "uncensored" ? "/photos/listvotemore?page=" + (Xem.ListPhoto.page + 1) + "&sort=" + Xem.ListPhoto.voteSort
                : "/photos/more?sort=" + Xem.ListPhoto.sort + "&page=" + (Xem.ListPhoto.page + 1),
            dataType: "html",
            success: function (data) {
                if (data == "Unauthenticated") {
                    $(".notLogin").show();
                }
                else if (data == "No more") {
                    Xem.ListPhoto.hasNoMore = true;
                }
                else {
                    /*var ads = "<div class='photoListItem' style='text-align: center'>";
                    ads += "<div class='listItemSeparator'>";
                    ads += "</div>";
                    ads += "<div style='margin:auto;width:336px'><!-- /165899848/xem.vn-desktop-banner-index-category-center-336x280 -->";
                    ads += "<div id='div-gpt-ad-1494089602792-"+ Xem.ListPhoto.page +"' style='height:280px; width:336px;'>";
                    ads += "<script>";
                    ads += "googletag.cmd.push(function() { googletag.display('div-gpt-ad-1494089602792-"+ Xem.ListPhoto.page +"'); });";
                    ads += "</script>";
                    ads += "</div>";
                    ads += "</div>";
                    ads += "</div>";*/
                    var ads = "";

                    var dataJ = $("<div>" + data + "</div>");
                    $(".photoListItem", dataJ).each(function () {
                        if ($(this).data("ads") == true) {
                            console.log($(this));
                            return;
                        }
                        if ($(".photoListItem[data-id=" + $(this).attr("data-id") + "]").size() > 0) {
                            console.log("removed");
                            $(this).remove();
                        } else if (Xem.ListPhoto.sort != "vote") {
                            var src = $(".thumbnail img.thumbImg", $(this)).attr("data-src");
                            if (src) {
                                if ($(this).data("nsfw") != "True")
                                    src = src.replace(/\!/g, '9').replace(/\@/g, '1').replace(/\#/g, '6');
                                $(".thumbnail img.thumbImg", $(this)).attr("src", src);
                            }
                        }
                    });
                    $("#listEnd").before(ads + dataJ.html());

                    $(".dfpUnitNew").each(function () {
                        var id = $(this).attr("id");
                        $(this).removeClass("dfpUnitNew");
                        googletag.cmd.push(function () {
                            googletag.pubads().enableAsyncRendering();
                            googletag.enableServices();
                            googletag.display(id);
                        });
                    });

                    try {
                        FB.XFBML.parse();
                    } catch (e) { }

                    Xem.ListPhoto.page++;
                    if (Xem.ListPhoto.page - Xem.ListPhoto.initPage == 2) {
                        Xem.ListPhoto.hasNoMore = true;
                        $(".nextListPage").show();
                    }
                }
            },
            error: function () {
            },
            complete: function () {
                Xem.ListPhoto.isLoading = false;
                $(".loading").hide();
            }
        });
    }
};

Xem.ListPhoto.fixInfoPanel = function () {
    $(".photoListItem").each(function () {
        var s = $(window).scrollTop();
        var thiss = $(this);
        var info = $(".info", this);
        if (thiss.offset().top - 60 < s && s < thiss.offset().top - 60 + thiss.outerHeight()) {
            if (s + info.outerHeight() < thiss.offset().top + thiss.outerHeight() - 70) {
                info.css({ position: "fixed", top: "60px" });
                // Mark as read
                //if (thiss.data("newly-listed") == "True") {
                //    Xem.Unread.addReadPhoto(parseInt(thiss.data("id")));
                //}
            } else {
                info.css({ position: "relative", top: "" });
            }
        } else {
            info.css({ position: "relative", top: "" });
        }
        //Mark as read
        if (thiss.data("newly-listed") == "True") {
            Xem.Unread.addReadPhoto(parseInt(thiss.data("id")));
        }
    });
};

Xem.ListPhoto.registerTopContributorSortClick = function () {
    $(".topUsersSortHome a").click(function (e) {
        e.preventDefault();

        var newSort = $(this).attr("data-sort");
        if (newSort == Xem.ListPhoto.topContributorSort)
            return;

        Xem.ListPhoto.topContributorSort = newSort;
        $(".topUsersSortHome a").removeClass("selected");
        $(this).addClass("selected");

        $("#topUserContent").load("/topContributors/" + newSort);
    });
};

Xem.ListPhoto.registerHotkeys = function () {
    $(document).keydown(function (e) {
        var tagName = e.target.tagName;
        if (tagName === 'INPUT' || tagName === 'TEXTAREA' || tagName === 'SELECT')
            return;
        var code = e.keyCode;
        if (code == 37 || code == 90) { // prev
            var found = false;
            $($(".listItemSeparator").get().reverse()).each(function () {
                if ($(this).offset().top - 60 < $(window).scrollTop()) {
                    scrollTo(0, $(this).offset().top - 60);
                    found = true;
                    return false;
                }
            });
            if (!found)
                scrollTo(0, 0);
        } else if (code == 39 || code == 88) { // next
            $(".listItemSeparator").each(function () {
                if ($(this).offset().top - 62 > $(window).scrollTop()) {
                    scrollTo(0, $(this).offset().top - 60);
                    return false;
                }
            });
        }
    });
};

Xem.ListPhoto.registerHideClick = function () {
    $("a.hide").live('click', function (e) {
        e.preventDefault();
        var a = $(this);

        $.post('/photos/hide', { id: a.attr('data-id') }, function (data) {
            if (data.Success) {
                a.html("Hidden successfully");
            } else {
                a.html(data.Message);
            }
            a.addClass("disabled");
        });
    });

    $("a.tovote").live('click', function (e) {
        e.preventDefault();
        var a = $(this);

        $.post('/photos/tovote', { id: a.attr('data-id') }, function (data) {
            var res = $.parseJSON(data);
            if (res.Success) {
                a.html("Voting");
            } else {
                a.html(res.Message);
            }
            a.addClass("disabled");
        });
    });

    $("a.hideVideo").live('click', function (e) {
        e.preventDefault();
        var a = $(this);

        $.post('/video/hide', { id: a.attr('data-id') }, function (data) {
            if (data.Success) {
                a.html("Hidden successfully");
            } else {
                a.html(data.Message);
            }
            a.addClass("disabled");
        });
    });

    $("a.tovoteVideo").live('click', function (e) {
        e.preventDefault();
        var a = $(this);

        $.post('/video/tovote', { id: a.attr('data-id') }, function (data) {
            var res = $.parseJSON(data);
            if (res.Success) {
                a.html("Voting");
            } else {
                a.html(res.Message);
            }
            a.addClass("disabled");
        });
    });
};

Xem.ListVideo.registerHideClick = function () {
    $("a.hide").live('click', function (e) {
        e.preventDefault();
        var a = $(this);

        $.post('/video/hide', { id: a.attr('data-id') }, function (data) {
            if (data.Success) {
                a.html("Hidden successfully");
            } else {
                a.html(data.Message);
            }
            a.addClass("disabled");
        });
    });

    $("a.tovote").live('click', function (e) {
        e.preventDefault();
        var a = $(this);

        $.post('/video/tovote', { id: a.attr('data-id') }, function (data) {
            var res = $.parseJSON(data);
            if (res.Success) {
                a.html("Voting");
            } else {
                a.html(res.Message);
            }
            a.addClass("disabled");
        });
    });
};

Xem.PhotoDetails = {
    photoId: null
};

Xem.PhotoDetails.init = function (photoId, isMobile) {
    Xem.PhotoDetails.photoId = photoId;
    $(document).ready(function () {
        if (!isMobile) {
            Xem.PhotoDetails.showTip();
            Xem.PhotoDetails.registerHotKeys();
            Xem.Reporting.handleReports(true);
            Xem.ListPhoto.registerVoteButtonClick();
            Xem.PhotoDetails.registerDeleteClick();
            Xem.PhotoDetails.registerStaffDeleteClick();
            Xem.PhotoDetails.addRef();
            Xem.PhotoDetails.registerFavoriteClick();
            //Xem.ListPhoto.initExtPopup();
        }
        Xem.PhotoDetails.registerHideClick();
        var rand = Math.floor((Math.random() * 10000000000) + 1);
        $.get("/photo/iv/"+photoId, { hash:rand});
    });

    var exists = window.fbAsyncInit;
    window.fbAsyncInit = function () {
        if (exists) {
            exists.apply(this);
        }
        if (typeof (Xem.Facebook.preInit) == 'function') {
            Xem.Facebook.preInit();
        }
        FB.Event.subscribe('comment.create', Xem.PhotoDetails.recount);
        FB.Event.subscribe('comment.remove', Xem.PhotoDetails.recount);
        FB.Event.subscribe('edge.create', Xem.PhotoDetails.recount);
        FB.Event.subscribe('edge.remove', Xem.PhotoDetails.recount);

        if (typeof (Xem.Facebook.postInit) == 'function') {
            Xem.Facebook.postInit();
        }
    };

    window.hvlAsyncInit = function () {
        HVL.Event.subscribe('comments.changed', Xem.PhotoDetails.recount);
    };
};

Xem.PhotoDetails.showTip = function () {
    var tips = [
        "Ảnh có thể không hay, nhưng bình luận là phải chất!",
        "Nếu có nhiều bình luận, bạn có thể xem theo độ hot, mới nhất, cũ nhất",
        "Post quảng cáo, spam trong bình luận sẽ bị ban ngay lập tức",
        "Không nói tục chửi bậy. Rất nhiều từ bậy bị lọc tự động.",
        "Ấn F5 nếu bình luận không tải được hoặc bị lỗi",
        "Click vào nút X bên phải bình luận để đánh dấu spam nếu bạn thấy",
        "Không post link đến ảnh của bạn để nhờ vote, like...",
        "Like bình luận hay là 1 nét đẹp văn hóa",
        "Thấy phong trào bình luận vớ vẩn? Đơn giản đừng hưởng ứng nó.",
        "Đăng nhập vào Facebook để bắt đầu bình luận. Xem thêm <a href='/cach-vao-facebook-bi-chan-mang-vnpt-viettel-fpt'>cách vào Facebook</a>.",
        "Không post thông tin cá nhân của người khác (kể cả Facebook) vào bình luận",
        "Có rất nhiều mẹo, F5 để đọc thêm"];
    var i = Math.floor((Math.random() * tips.length));
    $(".tipComment").html("<b class='meo'>Mẹo: </b>" + tips[i]);
};

Xem.PhotoDetails.recount = function () {
    $.post("/photos/count/" + Xem.PhotoDetails.photoId);
};

Xem.VideoDetails.recount = function () {
    $.post("/video/count/" + Xem.VideoDetails.videoId);
};

Xem.PhotoDetails.registerHotKeys = function () {
    $(document).keydown(function (e) {
        var tagName = e.target.tagName;
        if (tagName === 'INPUT' || tagName === 'TEXTAREA' || tagName === 'SELECT')
            return;
        var code = e.keyCode;
        if (code == 37 || code == 90) { // prev
            if ($(".navButtons a.prev").size() > 0)
                window.location.href = $(".navButtons a.prev").attr("href");
        } else if (code == 39 || code == 88) { // next
            if ($(".navButtons a.next").size() > 0)
                window.location.href = $(".navButtons a.next").attr("href");
        }
    });
};

Xem.PhotoDetails.registerDeleteClick = function () {
    $("#deletePhoto").click(function (e) {
        e.preventDefault();
        if (confirm("Bạn có chắc chắn muốn xóa?") == true) {
            $("#deleteForm").submit();
        }
    });
};

Xem.VideoDetails.registerDeleteClick = function () {
    $("#deletePhoto").click(function (e) {
        e.preventDefault();
        if (confirm("Bạn có chắc chắn muốn xóa?") == true) {
            $("#deleteForm").submit();
        }
    });
};

Xem.PhotoDetails.registerStaffDeleteClick = function () {
    $("[data-role=delete]").fancybox({
        width: '500px',
        height: '220px',
        autoSize: false,
        openEffect: 'none',
        closeEffect: 'none',
        closeBtn: false
    });
    $("[data-action=delete]").click(function (e) {
        e.preventDefault();
        var reason = $.trim($("#deleteReasonFreeText").val());
        if (reason == "") {
            reason = $("#deleteReasonDdl").val();
        }
        $('#reason').val(reason);
        $.fancybox.close();
        $.post('/photos/deletebystaff', { photoId: Xem.PhotoDetails.photoId, reason: reason }, function (res) {
            $("[data-role=delete]").replaceWith(function() {
                return $('<span />').html(res == 'OK' ? 'deleted' : res).css({ 'margin-right': '10px' });
            });
        });
    });
};

Xem.VideoDetails.registerStaffDeleteClick = function () {
    $("[data-role=delete]").fancybox({
        width: '500px',
        height: '220px',
        autoSize: false,
        openEffect: 'none',
        closeEffect: 'none',
        closeBtn: false
    });
    $("[data-action=delete]").click(function (e) {
        e.preventDefault();
        var reason = $.trim($("#deleteReasonFreeText").val());
        if (reason == "") {
            reason = $("#deleteReasonDdl").val();
        }
        $('#reason').val(reason);
        $.fancybox.close();
        $.post('/video/deletebystaff', { videoId: Xem.VideoDetails.videoId, reason: reason }, function (res) {
            $("[data-role=delete]").replaceWith(function() {
                return $('<span />').html(res == 'OK' ? 'deleted' : res).css({ 'margin-right': '10px' });
            });
        });
    });
};

Xem.PhotoDetails.registerHideClick = function () {
    $("#hidePhoto").click(function (e) {
        e.preventDefault();
        if (confirm("Sure?") == false) {
            return false;
        }

        var a = $(this);

        $.post('/photos/hide', { id: a.attr('data-id') }, function (data) {
            if (data.Success) {
                a.html("Hidden successfully");
            } else {
                a.html(data.Message);
            }
            a.addClass("disabled");
        });
    });
};

Xem.PhotoDetails.addRef = function () {
    var i = 1;
    $(".randomBox .photoListItemSmall a").each(function () {
        $(this).attr("href", $(this).attr("href") + "?ref=r" + i);
        i++;
    });
    i = 1;
    $(".newestBox .photoListItemSmall a").each(function () {
        $(this).attr("href", $(this).attr("href") + "?ref=n" + i);
        i++;
    });
};

Xem.PhotoDetails.registerFavoriteClick = function () {
    $('[data-action=favor]').click(function () {
        var $this = $(this);
        var $fav = $this.find('.fav');
        var remove = $fav.hasClass('active');
        $fav.next().text(remove ? "Lưu vào yêu thích" : "Xóa khỏi yêu thích");
        $.post('/photos/favor', { photoId: Xem.PhotoDetails.photoId, remove: remove });
        $fav.toggleClass('active');
    });
};

Xem.VideoDetails.registerFavoriteClick = function () {
    $('[data-action=favor]').click(function () {
        var $this = $(this);
        var $fav = $this.find('.fav');
        var remove = $fav.hasClass('active');
        $fav.next().text(remove ? "Lưu vào yêu thích" : "Xóa khỏi yêu thích");
        $.post('/video/favor', { videoId: Xem.VideoDetails.videoId, remove: remove });
        $fav.toggleClass('active');
    });
};

Xem.Uploader = {
    isLoading: false,
    page: 1,
    initPage: 1,
    hasNoMore: false,
    uploaderId: null
};

Xem.Uploader.init = function (uploaderId, page) {
    Xem.Uploader.uploaderId = uploaderId;
    Xem.Uploader.page = page;
    Xem.Uploader.initPage = page;

    $(document).ready(function () {
        Xem.ListPhoto.registerHotkeys();
        $(window).scroll(function () {
            Xem.Uploader.loadMore();
            Xem.ListPhoto.fixInfoPanel();
        });
    });
};

Xem.Uploader.loadMore = function () {
    if ($(window).scrollTop() + $(window).height() >= $(document).height() - 50) {
        if (Xem.Uploader.isLoading || Xem.Uploader.hasNoMore)
            return;

        Xem.Uploader.isLoading = true;
        $(".loading").show();
        $.ajax({
            url: "/photos/uploadermore/" + Xem.Uploader.uploaderId + "?page=" + (Xem.Uploader.page + 1),
            dataType: "html",
            success: function (data) {
                if (data == "No more")
                    Xem.Uploader.hasNoMore = true;
                else {
                    var dataJ = $("<div>" + data + "</div>");
                    $(".photoListItem", dataJ).each(function () {
                        if ($(".photoListItem[data-id=" + $(this).attr("data-id") + "]").size() > 0) {
                            console.log("removed");
                            $(this).remove();
                        }
                    });
                    $("#listEnd").before(dataJ.html());

                    try {
                        FB.XFBML.parse();
                    } catch (e) { }

                    Xem.Uploader.page++;
                    if (Xem.Uploader.page - Xem.Uploader.initPage == 2) {
                        Xem.Uploader.hasNoMore = true;
                        $(".nextListPage").show();
                    }
                }
            },
            error: function () {

            },
            complete: function () {
                Xem.Uploader.isLoading = false;
                $(".loading").hide();
            }
        });
    }
};

Xem.VideoUploader = {
    isLoading: false,
    page: 1,
    initPage: 1,
    hasNoMore: false,
    uploaderId: null
};

Xem.VideoUploader.init = function (uploaderId, page) {
    Xem.VideoUploader.uploaderId = uploaderId;
    Xem.VideoUploader.page = page;
    Xem.VideoUploader.initPage = page;

    $(document).ready(function () {
        Xem.ListPhoto.registerHotkeys();
        $(window).scroll(function () {
            Xem.VideoUploader.loadMore();
            Xem.ListPhoto.fixInfoPanel();
        });
    });
};

Xem.VideoUploader.loadMore = function () {
    if ($(window).scrollTop() + $(window).height() >= $(document).height() - 50) {
        if (Xem.VideoUploader.isLoading || Xem.VideoUploader.hasNoMore)
            return;

        Xem.VideoUploader.isLoading = true;
        $(".loading").show();
        $.ajax({
            url: "/video/uploadermore/" + Xem.VideoUploader.uploaderId + "?page=" + (Xem.VideoUploader.page + 1),
            dataType: "html",
            success: function (data) {
                if (data == "No more")
                    Xem.VideoUploader.hasNoMore = true;
                else {
                    var dataJ = $("<div>" + data + "</div>");
                    $(".photoListItem", dataJ).each(function () {
                        if ($(".photoListItem[data-id=" + $(this).attr("data-id") + "]").size() > 0) {
                            console.log("removed");
                            $(this).remove();
                        }
                    });
                    $("#listEnd").before(dataJ.html());

                    try {
                        FB.XFBML.parse();
                    } catch (e) { }

                    Xem.VideoUploader.page++;
                    if (Xem.VideoUploader.page - Xem.VideoUploader.initPage == 2) {
                        Xem.VideoUploader.hasNoMore = true;
                        $(".nextListPage").show();
                    }
                }
            },
            error: function () {

            },
            complete: function () {
                Xem.VideoUploader.isLoading = false;
                $(".loading").hide();
            }
        });
    }
};

Xem.Upload = {};
Xem.Upload.init = function (quotaExceeded, isSelfMade) {
    $(document).ready(function () {
        if (quotaExceeded)
            $(".inputForm input, .inputForm textarea, .inputForm .buttons").attr("disabled", "disabled");
        if (isSelfMade)
            $("#mko_xemcorebundle_photos_source").attr("disabled", "disabled");
        //$("#Source").attr("disabled", "disabled");

        //Xem.Upload.registerSelfMadeChange();
        Xem.Upload.isSelfMadeChange();
        Xem.Upload.checkLikeBeggar();
    });
};

Xem.UploadVideo = {};
Xem.UploadVideo.init = function (quotaExceeded) {
    $(document).ready(function () {
        if (quotaExceeded)
            $(".inputForm input, .inputForm textarea, .inputForm .buttons").attr("disabled", "disabled");
        Xem.Upload.checkLikeBeggar();
        Xem.UploadVideo.handleYoutubeUrl();
    });
};

Xem.UploadVideo.handleYoutubeUrl = function () {
    $("#YoutubeUrl").change(function () {
        // Get youtube Id
        var youtubeId = Mko.Util.getParameter("v", $("#YoutubeUrl").val());
        if (youtubeId == "") {
            alert("Đường dẫn Youtube không đúng.");
            return;
        }

        $("#youtubeEmbed").html("<iframe width='518' height='300' src='http://www.youtube.com/embed/" + youtubeId + "' frameborder='0'></iframe>");
        $("#youtubeEmbed").show();
    });
};

Xem.Edit = {};
Xem.Edit.init = function (isSelfMade) {
    $(document).ready(function () {
        if (isSelfMade)
            $("#Source").attr("disabled", "disabled");

        Xem.Upload.registerSelfMadeChange();
        Xem.Upload.checkLikeBeggar();
    });
};

Xem.Upload.registerSelfMadeChange = function () {
    $("#IsSelfMade").click(function () {
        $("#Source").val('');
        $("#Source").attr("disabled", "disabled");

        if (!$("#IsSelfMade").is(':checked')) {
            $("#Source").prop("disabled", false);
        }
    });
};

Xem.Upload.isSelfMadeChange = function () {
    var isSelfMade = $("#mko_xemcorebundle_photos_is_self_made");
    var photoSource = $("#mko_xemcorebundle_photos_source");

    isSelfMade.click(function () {
        photoSource.val('');
        photoSource.attr("disabled", "disabled");

        if (!isSelfMade.is(':checked')) {
            isSelfMade.val(0);
            photoSource.prop("disabled", false);
        } else {
            isSelfMade.val(1);
        }
    });
};

Xem.Upload.checkLikeBeggar = function () {
    $("#Caption").change(function () {
        if ($(this).val().toLowerCase().indexOf("like") >= 0)
            alert("Chú ý: ảnh có tiêu đề câu like có thể bị xóa (xem nội quy bên phải).");
    });
};

Xem.LocalStorage = {
    Keys: { ReadPhotos: "ReadPhotos" }
};

Xem.LocalStorage.isSupported = function () {
    try {
        localStorage.setItem("isSupported", true);
        localStorage.removeItem("isSupported");
        return true;
    } catch (e) {
        return false;
    }
};

Xem.Unread = {
    justRead: {},
    submitted: {},
    isLoading: false,
    hasNoMore: false,
    page: 0,
    initPage: 0,
    shouldTrack: false
};

Xem.Unread.addReadPhoto = function (id) {
    if (!Xem.Unread.shouldTrack)
        return;

    if (!Xem.Unread.justRead[id]) {
        Xem.Unread.justRead[id] = true;
    }
};

Xem.Unread.getJustReadPhotoIds = function () {
    var ids = "";
    for (var id in Xem.Unread.justRead) {
        if (ids == "")
            ids += id;
        else
            ids += "," + id;
    }

    return ids;
};

Xem.Unread.submit = function (async) {
    var toSubmit = [];
    var ids = "";
    for (var id in Xem.Unread.justRead) {
        if (!Xem.Unread.submitted[id]) {
            Xem.Unread.submitted[id] = true;
            toSubmit.push(id);
            if (ids == "")
                ids += id;
            else
                ids += "," + id;
        }
    }

    if (ids == "")
        return;

    $.ajax({
        url: "/photos/markread",
        dataType: "html",
        type: "POST",
        async: async,
        data: { photoIds: ids },
        success: function () {
        },
        error: function () {
            // Unmark
            for (var i in toSubmit)
                delete Xem.Unread.submitted[i];
        },
        complete: function () {
        }
    });
};

Xem.Unread.startTracking = function () {
    $(document).ready(function () {
        Xem.Unread.shouldTrack = true;

        setInterval(function () {
            Xem.Unread.submit(true);
        }, 30000);

        window.onbeforeunload = function () {
            Xem.Unread.submit(false);
        };
    });
};

Xem.Unread.init = function () {
    $(document).ready(function () {
        Xem.Unread.startTracking();
        Xem.ListPhoto.registerHotkeys();
        Xem.Unread.loadSinglePage();
        $(window).scroll(function () {
            Xem.Unread.loadMore();
            Xem.ListPhoto.fixInfoPanel();
        });
    });
};

Xem.Unread.loadSinglePage = function () {
    Xem.Unread.isLoading = true;
    $(".loading").show();
    $.ajax({
        url: "/photos/listunreadajax",
        dataType: "html",
        type: "POST",
        data: { excludePhotoIds: Xem.Unread.getJustReadPhotoIds(), page : Xem.Unread.page },
        success: function (data) {
            if (data == "Unauthenticated") {
                $(".notLogin").show();
                Xem.Unread.hasNoMore = true;
            }
            else if (data == "No more") {
                Xem.Unread.hasNoMore = true;
                if (Xem.Unread.page == 0) {
                    $(".noUnread").show();
                }
            }
            else {
                var dataJ = $("<div>" + data + "</div>");
                $(".photoListItem", dataJ).each(function () {
                    if ($(".photoListItem[data-id=" + $(this).attr("data-id") + "]").size() > 0) {
                        $(this).remove();
                        console.log("Duplicate removed");
                    }
                });
                $("#listEnd").before(dataJ.html());

                try {
                    FB.XFBML.parse();
                } catch (e) { }

                Xem.Unread.page++;
                if (Xem.Unread.page - Xem.Unread.initPage == 3) {
                    Xem.Unread.hasNoMore = true;
                    $(".nextListPage").show();
                }
            }
        },
        error: function () {
        },
        complete: function () {
            Xem.Unread.isLoading = false;
            $(".loading").hide();
        }
    });
};

Xem.Unread.loadMore = function () {
    if ($(window).scrollTop() + $(window).height() >= $(document).height() - 300) {
        if (Xem.Unread.isLoading || Xem.Unread.hasNoMore)
            return;
        Xem.Unread.loadSinglePage();
    }
};

Xem.Comment = {
};
Xem.Comment.init = function () {
    (function () {
        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
        dsq.src = '//s.xem.vn/scripts/comment.embed.js?v=6';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    })();
};


/*!
 * jQuery Cookie Plugin v1.4.0
 * https://github.com/carhartl/jquery-cookie
 *
 * Copyright 2013 Klaus Hartl
 * Released under the MIT license
 */
(function (factory) {
    if (typeof define === 'function' && define.amd) {
        // AMD. Register as anonymous module.
        define(['jquery'], factory);
    } else {
        // Browser globals.
        factory(jQuery);
    }
}(function ($) {

    var pluses = /\+/g;

    function encode(s) {
        return config.raw ? s : encodeURIComponent(s);
    }

    function decode(s) {
        return config.raw ? s : decodeURIComponent(s);
    }

    function stringifyCookieValue(value) {
        return encode(config.json ? JSON.stringify(value) : String(value));
    }

    function parseCookieValue(s) {
        if (s.indexOf('"') === 0) {
            // This is a quoted cookie as according to RFC2068, unescape...
            s = s.slice(1, -1).replace(/\\"/g, '"').replace(/\\\\/g, '\\');
        }

        try {
            // Replace server-side written pluses with spaces.
            // If we can't decode the cookie, ignore it, it's unusable.
            // If we can't parse the cookie, ignore it, it's unusable.
            s = decodeURIComponent(s.replace(pluses, ' '));
            return config.json ? JSON.parse(s) : s;
        } catch (e) { }
    }

    function read(s, converter) {
        var value = config.raw ? s : parseCookieValue(s);
        return $.isFunction(converter) ? converter(value) : value;
    }

    var config = $.cookie = function (key, value, options) {

        // Write

        if (value !== undefined && !$.isFunction(value)) {
            options = $.extend({}, config.defaults, options);

            if (typeof options.expires === 'number') {
                var days = options.expires, t = options.expires = new Date();
                t.setTime(+t + days * 864e+5);
            }

            return (document.cookie = [
                encode(key), '=', stringifyCookieValue(value),
                options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
                options.path ? '; path=' + options.path : '',
                options.domain ? '; domain=' + options.domain : '',
                options.secure ? '; secure' : ''
            ].join(''));
        }

        // Read

        var result = key ? undefined : {};

        // To prevent the for loop in the first place assign an empty array
        // in case there are no cookies at all. Also prevents odd result when
        // calling $.cookie().
        var cookies = document.cookie ? document.cookie.split('; ') : [];

        for (var i = 0, l = cookies.length; i < l; i++) {
            var parts = cookies[i].split('=');
            var name = decode(parts.shift());
            var cookie = parts.join('=');

            if (key && key === name) {
                // If second argument (value) is a function it's a converter...
                result = read(cookie, value);
                break;
            }

            // Prevent storing a cookie that we couldn't decode.
            if (!key && (cookie = read(cookie)) !== undefined) {
                result[name] = cookie;
            }
        }

        return result;
    };

    config.defaults = {};

    $.removeCookie = function (key, options) {
        if ($.cookie(key) === undefined) {
            return false;
        }

        // Must not alter options, thus extending a fresh object...
        $.cookie(key, '', $.extend({}, options, { expires: -1 }));
        return !$.cookie(key);
    };

}));