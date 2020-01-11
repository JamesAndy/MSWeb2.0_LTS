package ex

import grails.gorm.transactions.Transactional
import grails.web.databinding.DataBinder
import grails.web.servlet.mvc.GrailsParameterMap

import java.lang.reflect.Array

@Transactional
class Ex100Service implements DataBinder {

    def i18nService,toolBoxService

    /**
     * 共同儲存欄位
     */
    ArrayList updateBindEx100Map = ['numbers', 'amts','string','status','idno','name','sex','birthdy','unid',
                                    'zip','citycode','twnspcode','vilgcode','addr']

    def filter(GrailsParameterMap params){
        LinkedHashMap result = [:]
        def dateTransform = []

        //查詢條件集
        def searchData = [:]
        def ex100L = []

        searchData.equalIntegerLists = ['ms100Id','amount']
        //相等
        searchData.equalList = ['numbers','amts','sex','citycode','twnspcode','vilgcode']
        //相似
        searchData.likeList = ['string','texts','idno','name','unid','zip','addr']
        //日期
        searchData.dateList = ['birthdy']
        searchData.dateList?.each{
            dateTransform << "${it}1"
            dateTransform << "${it}2"
        }

        params << toolBoxService.paramsTextDateTransform(params: params,list: dateTransform)

        def ex100List = Ex100.createCriteria().list(params) {
            //必要條件
            'in'("issure", ['1'.toLong(),'2'.toLong()])

            searchData.equalIntegerLists.each {field ->
                if(params."${field}") {
                    or {
                        def searchVal = params."${field}"
                        println searchVal
                        if(searchVal instanceof java.lang.String){
                            eq(field, searchVal.toLong())
                        }
                        else{
                            searchVal.each { val ->
                                eq(field, val.toLong())
                            }
                        }
                    }
                }
            }

            searchData.equalList.each {field ->
                if(params."${field}"){
                    eq(field,params."${field}")
                }
            }

            searchData.likeList.each {field ->
                if(params."${field}"){
                    like(field,'%'+params."${field}"+'%')
                }
            }

            searchData.dateList.each{field->  //date condition
                if(params."${field}1"){
                    ge(field, params."${field}1")
                }
                if(params."${field}2"){
                    lt(field, params."${field}2"+1)
                }
            }

        }

        ex100List.each {
            def row = [:]
            row.id = it?.id.toString()
            row.status = it?.status
            row.addr = it?.addr
            row.birthdy = it?.birthdy
            row.name = it?.name
            row.citycode = it?.citycode
            row.issure = it?.issure
            row.texts = it?.texts
            row.numbers = it?.numbers
            row.idno = it?.idno
            row.rode = it?.rode
            row.string = it?.string
            row.sex = it?.sex
            row.twnspcode = it?.twnspcode
            row.vilgcode = it?.vilgcode
            row.unid = it?.unid
            row.amts = it?.amts
            row.notes = it?.notes
            row.zip = it?.zip
            ex100L << row
        }
        result.rows = ex100L
        return result
    }

    /**
     * 儲存資料
     * @param params
     * @return
     */
    def doSave(GrailsParameterMap params) {
        LinkedHashMap result = [:]
        Ex100 ex100I
        if(params.ex100.id){
            ex100I = Ex100.get(params.ex100.id)
        }
        else {
            ex100I = new Ex100()
        }

        result.bean = ex100I
        bindData(ex100I, params["ex100"], [include: updateBindEx100Map])
        ex100I.manCreated = 'FWJDBA'
        ex100I.validate()
        if (ex100I.hasErrors() || !ex100I.save(flush: true)) { //失敗
            result.acrtionIsSuccess = false
            result.acrtionMessage = i18nService.msg("default.updated.failure", "", [""])
            return result
        }
        result.acrtionIsSuccess = true
        result.acrtionMessage = i18nService.msg("default.updated.message", "", [""])
        return result
    }

    /**
     * 刪除資料
     * @param params
     */
    def doDelete(GrailsParameterMap params){
        LinkedHashMap result = [:]
        Ex100 ex100I = Ex100.get(params.ex100.id)

        try{
            ex100I.delete(flush: true)
            result.acrtionIsSuccess = true
            result.acrtionMessage=i18nService.msg("default.deleted.message", "", [""])
        }
        catch (Exception ex){
            println ex
            result.acrtionIsSuccess = false
            result.acrtionMessage=i18nService.msg("default.not.deleted.message", "", [""])
        }
        finally {
            return result
        }
    }
}
