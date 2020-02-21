package ex

class Ex100 {
    static auditable = [ignore: ['dateCreated', 'lastUpdated', 'manCreated', 'manLastUpdated']]
    UUID id
    Long issure = 2
    String notes
    String		manCreated
    Date		dateCreated = new Date()
    String		manLastUpdated
    Date		lastUpdated = new Date()
    Long         numbers
    Long         amts
    String		string
    String		texts
    String		status
    String		idno
    String		name
    String		sex
    Date        birthdy
    String		unid
    String		zip
    String		citycode
    String		twnspcode
    String		vilgcode
    String		rode
    String		addr

    String statusDesc
    String sexDesc
    String citycodeDesc
    String twnspcodeDesc
    String vilgcodeDesc
    String addrFull


    static mapping = {


        dynamicInsert true
        table 'EX100'
        comment '資料範例'
        version true

        id					column:"UUID",generator: "uuid2", type: "uuid-binary", length: 16
        issure				column:"ISSURE"         ,comment:"資料狀態"
        notes				column:"NOTES"          ,comment:"資料註記"
        dateCreated			column:"DATE_CREATED",	comment:"資料建立時間"
        manCreated			column:"MAN_CREATED",	comment:"資料建立者"
        lastUpdated			column:"LAST_UPDATED",	comment:"資料更新人"
        manLastUpdated		column:"MAN_LAST_UPDATED",comment:"資料更新者"
        numbers             column: "NUMBERS"       ,comment: "數值"
        amts                column: "AMTS"          ,comment: "金額"
        string              column: "STRING"        ,comment: "字串"
        texts               column: "TEXTS"         ,comment: "文章"
        status              column: "STATUS"        ,comment: "案件狀態,BS101.EX100_STATUS"
        statusDesc          ignoreNotFound: true    ,comment: "案件狀態中文敘述"           ,formula: "(SELECT BS.TYPEDESC FROM BS101 BS WHERE BS.PTYPE='EX100_STATUS' AND BS.PCODE=STATUS  )"
        idno                column: "IDNO"          ,comment: "身分證字號"
        name                column: "NAME"          ,comment: "姓名"
        sex                 column: "SEX"           ,comment: "性別,BS101.GENDER"
        sexDesc             ignoreNotFound: true    ,comment:"性別中文敘述"                ,formula: "(SELECT BS.TYPEDESC FROM BS101 BS WHERE BS.PTYPE='GENDER' AND BS.PCODE=SEX  )"
        birthdy             column: "BIRTHDT"       ,comment: "生日"
        unid                column: "UNID"          ,comment: "公司統編"
        zip                 column: "ZIP"           ,comment: "郵遞區號"
        citycode            column: "CITYCODE"      ,comment: "縣、市"
        citycodeDesc        ignoreNotFound: true    ,comment:"縣、市中文敘述"              ,formula: "(SELECT B2.TEXT_SHOW FROM BS200 B2 WHERE B2.CODE = CITYCODE )"
        twnspcode           column: "TWNSPCODE"     ,comment: "鄉、鎮、縣市"
        twnspcodeDesc       ignoreNotFound: true    ,comment:"鄉、鎮、縣市中文敘述"        ,formula: "(SELECT B2.TEXT_SHOW FROM BS201 B2 WHERE B2.CODE = TWNSPCODE )"
        vilgcode            column: "VILGCODE"      ,comment: "里別"
        vilgcodeDesc        ignoreNotFound: true    ,comment:"里別中文敘述"                ,formula: "(SELECT B2.TEXT_SHOW FROM BS202 B2 WHERE B2.CODE = VILGCODE )"
        rode                column: "RODE"          ,comment: "道路"
        addr                column: "ADDR"          ,comment: "地址"
        addrFull            ignoreNotFound: true    ,comment:" 地址全"                     ,formula: "(CONCAT(NVL(ZIP,''),NVL((SELECT B2.TEXT_SHOW FROM BS200 B2 WHERE B2.CODE = CITYCODE ),''),NVL((SELECT B2.TEXT_SHOW FROM BS201 B2 WHERE B2.CODE = TWNSPCODE ),''),NVL((SELECT B2.TEXT_SHOW FROM BS202 B2 WHERE B2.CODE = VILGCODE),''),NVL(ADDR,'')))"

    }

    static constraints = {
        issure				(nullable:false, blank: false)
        notes				(nullable:true, maxSize: 1000)
        dateCreated			(nullable:false, blank: false)
        manCreated			(nullable:false, blank: false, maxSize: 200)
        lastUpdated			(nullable:true)
        manLastUpdated		(nullable:true, maxSize: 200)
        numbers             (nullable:true)
        amts                (nullable:true)
        string              (nullable:true, blank: true, maxSize: 20)
        texts               (nullable:true, blank: true)
        status              (nullable:true, blank: true, maxSize: 200)
        idno                (nullable:true, blank: true, maxSize: 20)
        name                (nullable:true, blank: true, maxSize: 200)
        sex                 (nullable:true, blank: true, maxSize: 200)
        birthdy             (nullable:true)
        unid                (nullable:true, blank: true, maxSize: 20)
        zip                 (nullable:true, blank: true, maxSize: 10)
        citycode            (nullable:true, blank: true, maxSize: 100)
        twnspcode           (nullable:true, blank: true, maxSize: 100)
        vilgcode            (nullable:true, blank: true, maxSize: 100)
        rode                (nullable:true, blank: true, maxSize: 1000)
        addr                (nullable:true, blank: true, maxSize: 1000)
    }

    /**
     * 共同儲存欄位
     */
    ArrayList updateBindMap = ['numbers', 'amts','string','status','idno','name','sex','birthdy','unid',
                                    'zip','citycode','twnspcode','vilgcode','addr']
}
