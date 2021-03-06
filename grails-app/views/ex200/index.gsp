<%--
  Created by JamesChang
  Date/檔案建立日期: 2020/2/2
  Time/檔案建立時間: 下午 12:13
  File Description/檔案描述:
--%>
<%@ page import="bs.Bs101" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="iframePage"/>
</head>
<body>

<form id="search">
    <div class="container-fluid" >
        <div class="row">
            <table class="table table-bordered">
                <colgroup>
                    <col width="20%">
                    <col width="30%">
                    <col width="20%">
                    <col width="30%">
                </colgroup>
                <thead>
                <tr class="bg-info">
                    <th colspan="4">
                        <icon:svg iconType="search" message="${g.message(code: 'page.default.search.label')}"/>
                    </th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.numbers.label')}</th>
                    <td><jc:numberField name="numbers" /></td>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.amts.label')}</th>
                    <td>
                        <jc:moneyField name="amts" />
                    </td>
                </tr>
                <tr>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.string.label')}</th>
                    <td><jc:textField name="string"/></td>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.texts.label')}</th>
                    <td><jc:textField name="texts"/></td>
                </tr>
                <tr>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.idno.label')}</th>
                    <td colspan="3"><jc:textField name="idno"/></td>
                </tr>
                <tr>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.name.label')}</th>
                    <td><jc:textField name="name"/></td>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.sex.label')}</th>
                    <td>
                        <jc:multipleSelect name="sex" from="${bs.Bs101.findAllByPtype('GENDER')}" optionKey="pcode" optionValue="typedesc" noSelection="['':'---']" />
                    </td>
                </tr>
                <tr>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.birthdy.label')}</th>
                    <td>
                        <jc:datepicker name="birthdy1"/>至<jc:datepicker name="birthdy2"/>
                    </td>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.unid.label')}</th>
                    <td><jc:numberField name="unid" /></td>
                </tr>
                <tr>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.addr.label')}</th>
                    <td colspan="3">
                        <div class="form-row">
                            <div class="col-1">
                                <jc:textField name="zip" placeholder="${g.message(code:  'ex100.zip.label')}" />
                            </div>
                            <div class="col-auto">
                                <jc:multipleSelect name="citycode" class=""
                                                   from="${bs.Bs200.getAll()}"
                                                   optionKey="code" optionValue="textShow" noSelection="['':'---']"
                                                   nextSelectId="twnspcode" nextSelectUrl="${createLink(controller: "toolBox",action: "getBs201Select")}"
                                />
                            </div>
                            <div class="col-auto">
                                <jc:multipleSelect name="twnspcode" class="addrChang"
                                                   from="[[key:'',val:'---']]" optionKey="key" optionValue="val"
                                                   nextSelectId="vilgcode" nextSelectUrl="${createLink(controller: "toolBox",action: "getBs202Select")}"
                                />
                            </div>
                            <div class="col-auto">
                                <jc:multipleSelect name="vilgcode" class="" from="[[key:'',val:'---']]" optionKey="key" optionValue="val"/>
                            </div>
                            <div class="col-5">
                                <jc:textField name="addr" class="" placeholder="${g.message(code:  'ex100.addr.label')}"/>
                            </div>
                        </div>
                    </td>
                </tr>

                </tbody>
                <tfoot><tr><td colspan="4">
                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <jc:bottom type="button" class="btn btn-outline-primary" onclick="searchFrom('searchTable','search','${createLink(action: 'filter')}')">${g.message(code: 'default.button.search.label')}</jc:bottom>
                        <jc:bottom type="button" class="btn btn-outline-info">${g.message(code: 'default.button.export.label')}</jc:bottom>
                        <jc:bottom type="button" class="btn btn-outline" onclick="clearFrom()">${g.message(code: 'default.button.clear.label')}</jc:bottom>
                    </div>
                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <jc:bottom onclick="changContent('${createLink(controller: "ex200", action: "creatPage")}/creat-data','creat-data');"  type="button" class="btn btn-outline-success">${g.message(code: 'default.button.create.label')}</jc:bottom>
                    </div>
                </td></tr></tfoot>
            </table>
        </div>
    </div>
</form>
<div class="m-2">

    <a id="AC" name="C" accesskey="C" href="#C" title="${message(code: 'system.free.center.label')}"> ::: </a>
    <jc:bootstrapTable id="searchTable" url="${g.createLink(controller: "ex100", action: "filter")}">
        <th data-field="id" data-formatter="formatterEditButton">${g.message(code: 'ex100.numbers.label')}</th>
        <th data-field="numbers" data-formatter="formatterNumber">${g.message(code: 'ex100.numbers.label')}</th>
        <th data-field="amts" data-formatter="formatterNumberAmt">${g.message(code: 'ex100.amts.label')}</th>
        <th data-field="string">${g.message(code: 'ex100.string.label')}</th>
        <th data-field="texts">${g.message(code: 'ex100.texts.label')}</th>
        <th data-field="status">${g.message(code: 'ex100.status.label')}</th>
        <th data-field="idno">${g.message(code: 'ex100.idno.label')}</th>
        <th data-field="sex">${g.message(code: 'ex100.sex.label')}</th>
        <th data-field="birthdy" data-formatter="formatterDatetime">${g.message(code: 'ex100.birthdy.label')}</th>
        <th data-field="unid">${g.message(code: 'ex100.unid.label')}</th>
        <th data-field="addrFull">${g.message(code: 'ex100.addr.label')}</th>
    </jc:bootstrapTable>
</div>


<!-- Modal -->
<span id="modalSpan" />
<script type="text/javascript">

    /**
     * 編輯按鈕
     * @param value
     * @param row
     * @param index
     * @returns {string}
     */
    function formatterEditButton(value, row, index) {
        var btnTitle ="編輯:"+row.numbers;
        var url = "${createLink(controller:'ex200',action: "editPage")}/"+row.id;
        var onclickFunction = "changContent('"+url+"','"+row.id+"');";
        return '<button type="button" class="btn btn-info search-edit-btn" onclick="'+onclickFunction+'"><i class="mdi mdi-edit"/> '+btnTitle+'</button>';
    }
</script>
</body>
</html>