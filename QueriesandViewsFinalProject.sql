use dmddproject;
show tables;

select ModelName from modeltable where Runtime_ID= 1;

select ModelName from modeltable where Runtime_ID= 2;

select ModelName from modeltable where Runtime_ID= 3;

select m.ModelName,m.Model_ID,m.runtime_ID,h.HP_ID,t.auc,t.mse,t.rmse,t.logloss,r.runtime from modeltable m , metrictable t , HPtable h, metadatatable r 
where m.Model_ID=h.Model_ID and h.HP_ID=t.HP_ID and r.Runtime_ID=m.Runtime_ID and modelname like "%GBM%" order by t.auc desc ;

select m.ModelName,m.Model_ID,m.runtime_ID,h.HP_ID,t.auc,t.mse,t.rmse,t.logloss,r.runtime from modeltable m , metrictable t , HPtable h, metadatatable r 
where m.Model_ID=h.Model_ID and h.HP_ID=t.HP_ID and r.Runtime_ID=m.Runtime_ID and modelname like "%GLM%" order by t.auc desc ;

select m.ModelName,m.Model_ID,m.runtime_ID,h.HP_ID,t.auc,t.mse,t.rmse,t.logloss,r.runtime from modeltable m , metrictable t , HPtable h, metadatatable r 
where m.Model_ID=h.Model_ID and h.HP_ID=t.HP_ID and r.Runtime_ID=m.Runtime_ID and modelname like "%DRF%" order by t.auc desc;

select m.ModelName, m.Model_ID, h.HP_ID, t.rmse from modeltable m , metrictable t , HPtable h where m.Model_ID=h.Model_ID and h.HP_ID=t.HP_ID
and t.rmse = (Select max(t.rmse) from metrictable t);

select m.ModelName, m.Model_ID, h.HP_ID, t.auc from modeltable m , metrictable t , HPtable h where m.Model_ID=h.Model_ID and h.HP_ID=t.HP_ID
and t.auc = (Select max(t.auc) from metrictable t);

select m.ModelName, m.Model_ID, h.HP_ID, t.mse from modeltable m , metrictable t , HPtable h where m.Model_ID=h.Model_ID and h.HP_ID=t.HP_ID
and t.mse = (Select max(t.mse) from metrictable t);

Create view GBMmodels500 as select ModelName, Model_ID from modeltable where modelname like "%GBM%" and Runtime_ID=1;
select * from GBMmodels500;

Create view GBMmodels1000 as select ModelName, Model_ID from modeltable where modelname like "%GBM%" and Runtime_ID=2;
select * from GBMmodels1000;

Create view GBMmodels1500 as select ModelName, Model_ID from modeltable where modelname like "%GBM%" and Runtime_ID=3;
select * from GBMmodels1500;

Create view GBMmodels as Select a.ModelName, a.Model_ID from modeltable a join HPtable b on a.Model_ID=b.Model_ID 
join metrictable c on b.HP_ID=c.Hp_ID where ModelName like "%GBM%";
