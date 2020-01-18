// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery.min.js
//= require popper.min.js
//= require bootstrap-material-design/bootstrap-material-design.min.js
//= require bootstrap.bundle.js
//= require jquery-ui/jquery-ui.min.js
//= require bootstrap-table/bootstrap-table.min.js
//= require bootstrap-table/bootstrap-table-locale-all.min.js"
//= require sweetalert2/sweetalert2.all.min.js
//= require numeral/numeral.min.js
//= encoding UTF-8

/**
 * JS擴充:DateFormat
 * 對Date的擴充套件，將 Date 轉化為指定格式的String
 * 月(M)、日(d)、小時(h)、分(m)、秒(s)、季度(q) 可以用 1-2 個佔位符，
 * 年(y)可以用 1-4 個佔位符，毫秒(S)只能用 1 個佔位符(是 1-3 位的數字)
 * 例子：
 * (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
   (new Date()).Format("yyyy-M-d h:m:s.S")   ==> 2006-7-2 8:9:4.18
 */
Date.prototype.Format = function (fmt) { //author: meizz
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "h+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

/**
 * 切換iframe
 */
function changeIframeMain(srcValue){
    $("#ifromDataMain").attr("src",srcValue);
    $('#myTab li:last-child a').tab('show');
}

/**
 *
 * @param optionId:替換Id
 * @param url
 * @param thisVal
 */
function ajaxChangSelectOption(thisVal,optionId,url){
    var select = jQuery(document.getElementById(optionId));
    jQuery.ajax({
        url: url,
        data:{whereItem:thisVal.toString()},
        type: "POST",
        ataType: "JSON",
        success: function (json) {
            for(var i=0;i < json.exportData.length; i++){
                var optionTag = document.createElement("option");
                optionTag.value = json.exportData[i].value;
                optionTag.text = json.exportData[i].text;
                select.append(optionTag);
            }
        },
        beforeSend:function(){
            select.children('option').remove();
        }
    });
}

/**
 * 開啟Modal
 * @param mondalId
 * @param url
 */
function openMondal(mondalId,url){
    var openMondalId = mondalId+'-'+_uuid();
    jQuery.ajax({
        url: url,
        data:{'modalId':openMondalId},
        type: "POST",
        ataType: "html",
        success: function (html) {
            jQuery('#'+mondalId).html(html);
            jQuery('#'+openMondalId).modal('show');
        }
    });
}

/**
 * 儲存後刷新Modal
 * @param closeModal
 * @param openModalId
 * @param forwardURL
 */
function forwardEditModeAfterDoSave(closeModalId,openModalId,forwardURL) {
    jQuery(document.getElementById(closeModalId)).modal('hide');
    Swal.fire({
        title: 'Your work has been saved',
        icon: 'success',
        position:'top',
        showConfirmButton: false,
        timer: 1500
    }).then((result) => {
        openMondal(openModalId,forwardURL);
    });
}

/**
 * 儲存失敗
 */
function doSaveFaild(activeMessageId,actionMessageContent) {
    var activeMessage = jQuery(document.getElementById(activeMessageId));
    Swal.fire({
        title: '失敗!',
        text: '請檢查資料是否正確',
        icon: 'warning',
        position:'top',
        showConfirmButton: false,
        timer: 1500
    });
    activeMessage.append(
        '<div class="alert alert-danger alert-dismissible fade show" role="alert">'+
        '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
        actionMessageContent+
        '</div>'
    );
}

/**
 *  儲存前先移除訊息
 * @param activeMessageId
 */
function doSaveBeforSend(activeMessageId) {
    var activeMessage = jQuery(document.getElementById(activeMessageId));
    activeMessage.children().remove();
}

/**
 * 時間戳記
 * @returns {string}
 * @private
 */
function _uuid() {
    var d = Date.now();
    if (typeof performance !== 'undefined' && typeof performance.now === 'function'){
        d += performance.now(); //use high-precision timer if available
    }
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
        var r = (d + Math.random() * 16) % 16 | 0;
        d = Math.floor(d / 16);
        return (c === 'x' ? r : (r & 0x3 | 0x8)).toString(16);
    });
}

/**
 * 清除表單內容
 */
function clearFrom(){
    jQuery('input[type=text]').val('');
    jQuery('input[type=number]').val('');
    jQuery('select').val('');
    jQuery('.hasDatepicker').datepicker('setDate', null);
}


/**
 * 一進入頁面執行
 */
$(function() {

});

// bootstrapTable常用

/**
 * 資料流水號
 * @param value
 * @param row
 * @param index
 * @returns {number}
 */
function formatterDataSerialNumber(value, row, index) {
    return Number(index) + 1;
}

/**
 * 日期格式化
 * @param value
 * @param row
 * @returns {*}
 */
function formatterDatetime(value,row) {
    if(value != null){
        return new Date(value).Format("yyyy-MM-dd");
    }
    else{
        return '-'
    }
}

/**
 * 金錢格式化
 * @param value
 */
function formatterNumberAmt(value) {
    if(value!=null){
        return numeral(value).format('$0,0.00');
    }
}

/**
 * 數字格式化
 * @param value
 * @returns {*}
 */
function formatterNumber(value) {
    if(value!=null){
        return numeral(value).format('0,0');
    }
}

/**
 * 總計
 * @returns {string}
 */
function footerFormatterTotal(data) {
    return '總計：'+data.length
}
