$('#txtPdmQtdCh_').priceFormat({ prefix: '', centsSeparator: ',', thousandsSeparator: '.' });

$(function () {
    $('#txtPdmIddMin').filter_input({ regex: '[0-9]' });
    $('#txtPdmIddMax').filter_input({ regex: '[0-9]' });
    $('#txtPdmQtdMax').filter_input({ regex: '[0-9]' });
    $('#txtPdmQtdDia').filter_input({ regex: '[0-9]' });
    $('#txtPdmQtdMes').filter_input({ regex: '[0-9]' });
    $('#txtPdmQtdAno').filter_input({ regex: '[0-9]' });
    $('#txtPdmRtn').filter_input({ regex: '[0-9]' });

    $('#txtPdmCod').mask("99.99.999-9");
    $('#txtPdmCodAmb').mask("99.99.999-9");
});