select measure_name, expression 
from $SYSTEM.MDSCHEMA_MEASURES 
where cube_name = 'model' and measure_is_visible
