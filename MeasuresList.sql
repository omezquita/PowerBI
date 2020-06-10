select measure_name, expression, default_format_string
from $SYSTEM.MDSCHEMA_MEASURES 
where cube_name = 'model' and measure_is_visible
