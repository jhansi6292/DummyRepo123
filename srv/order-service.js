const cds = require('@sap/cds');
module.exports = cds.service.impl(async function () {

    this.before('CREATE', 'SalesOrders', async (req) => {
        try {
             if (req.data.ID == ""||req.data.ID == undefined){
                req.error('500','Sales Order ID cannot be Blank');
             }
        }
        catch (error) {
            req.error('500', error);
        }
    });

});