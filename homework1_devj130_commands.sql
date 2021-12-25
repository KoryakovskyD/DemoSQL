-- 2
update AUTHORS
set OTHER = 'No data'
where OTHER is null;

-- 3
select DOC_NAME
from DOCUMENTS
    join AUTHORS on AUTHOR_ID = AUTHORS.ID
where AUTHORS.CUSTOMER_FIO = 'Tom Hawkins';

-- 4
select ID, DOC_NAME, AUTHOR_ID
from DOCUMENTS
where DOC_NAME like '%report%';


