mode: command
and mode: user.python
mode: command
and mode: user.auto_lang
and code.language: python
mode: command
and code.language: jupyter_notebook
# mode: command
# and title: /Interactive/
-
tag(): user.code_imperative
tag(): user.code_object_oriented

tag(): user.code_comment_line
tag(): user.code_comment_documentation
tag(): user.code_data_bool
tag(): user.code_data_null
tag(): user.code_functions
tag(): user.code_functions_gui
tag(): user.code_libraries
tag(): user.code_libraries_gui
tag(): user.code_operators_array
tag(): user.code_operators_assignment
tag(): user.code_operators_bitwise
tag(): user.code_operators_math

settings():
    user.code_private_function_formatter = "SNAKE_CASE"
    user.code_protected_function_formatter = "SNAKE_CASE"
    user.code_public_function_formatter = "SNAKE_CASE"
    user.code_private_variable_formatter = "SNAKE_CASE"
    user.code_protected_variable_formatter = "SNAKE_CASE"
    user.code_public_variable_formatter = "SNAKE_CASE"

#python-specific grammars
dunder in it: "__init__"
state (def | deaf | deft): "def "
state try: "try:\n"
state except: "except "
state raise: "raise "
self taught: "self."
pie test: "pytest"
state past: "pass"

raise {user.python_exception}: user.insert_cursor("raise {python_exception}([|])")
except {user.python_exception}: "except {python_exception}:"

dock string:
    user.code_comment_documentation()
dock {user.python_docstring_fields}:
    insert("{python_docstring_fields}")
    edit.left()
dock type {user.code_type}:
    user.insert_cursor(":type [|]: {code_type}")
dock returns type {user.code_type}:
    user.insert_cursor(":rtype [|]: {code_type}")

toggle imports: user.code_toggle_libraries()
import <user.code_libraries>:
    user.code_insert_library(code_libraries, "")
    key(end enter)

from import:
    insert('from import ')
    key('left')
    edit.word_left()
    key('space')
    edit.left()


dataframes: "df"

import pandas: 
    
import pandas: 
    insert("""
    import pandas as pd
    import numpy as np
    pd.set_option("mode.copy_on_write", True)
    """)

import geopandas: "import geopandas as gpd"
import numpy: "import numpy as np"
import stats models: "import statsmodels.formula.api as smf"

# Numpy/Pandas Methods
describe: ".describe()"
columns: ".columns"
head: ".head()"
mean: ".mean()"
copy: ".copy()"
all: ".all()"
any: ".any()"
not N/A: ".notna()"
is N/A: ".isna()"
hist: ".hist()"
# drop:
#     insert('.drop(columns=[""])')
#     key(left:3)
rename:
    insert('.rename(columns={""})')
    key(left:3)
    
assert: "assert "
sort index: ".sort_index()"
sort values: 
    insert('.sort_values([""])')
    key(left:3)

is in: 
    insert(".isin([])")
    edit.left()
    edit.left()

as type:
    insert('.astype("")')
    edit.left()
    edit.left()
sample one: 
    insert(".sample().T")
    key(shift-enter)

# Pandas
group by: 
    insert('.groupby([""], as_index=False)')
    key(left:19)

join:
    insert('.merge(, how="outer", indicator=True, validate="1:1")')
    key(left:46)

merge: "merge"

value counts: ".value_counts()"
value counts missing: ".value_counts(dropna=False)"
value counts normalized: ".value_counts(normalize=True)"
value counts normalized missing: ".value_counts(normalize=True, dropna=False)"
value counts missing normalized: ".value_counts(dropna=False, normalize=True)"
underscore merge: "_merge"
cake:
    insert('[""]')
    edit.left()
    edit.left()

cake named <user.text>:
    insert('["{user.text}"]')

cake list:
    insert('[[""]]')  
    edit.left()
    edit.left()
    edit.left()    

location: 
    insert(".loc[]")
    edit.left()

index location: 
    insert(".iloc[]")
    edit.left()

axis columns:'axis="columns"'

# Regular Python

false: "False"
true: "True"

not equals: " != "
double equals: " == "
greater equal: " >= "
less than equal: " <= "
gets: " = "

print that: 
    insert("print()")
    edit.left()

# l:
#     insert('len()')
#     edit.left()
Geo Chaisson: "geojson"
    
transform: 
    insert(".transform()")
    edit.left()

duplicated:
    insert(".duplicated()")


not no: ".notnull()"
(is na|is null): ".isnull()"
not a number: "np.nan"

lambda:
    insert("lambda x: ")

filter:
    insert('.filter(regex="", axis="columns")')
    key(left:18)


###########
# pymc
###########

beta:
    insert('pm.Beta("", alpha=, beta=)')
    key(left:17)
beta: 
    insert('pm.Beta("", alpha=, beta=)')
    key(left:17)
    

import pymc:
    insert("""
    import pymc as pm
    import arviz as az
    """)



###########
# Plotting
###########


import seaborn: 
    insert("""
    import seaborn.objects as so
    import seaborn as sns
    from matplotlib import style
    """)

seaborn plot: 
    insert("""(so.Plot(, x="", y="").add(so.)
        .label(title="")
        .theme({{**style.library["seaborn-whitegrid"]}})
    """)
    key(up:3)
    key(right:8)

seaborn lowess:
    insert("""
    from __future__ import annotations
    from dataclasses import dataclass

    import pandas as pd

    from seaborn._stats.base import Stat
    import statsmodels.api as sm


    @dataclass
    class Lowess(Stat):
        '''
        Fit a LOWESS smooth of data.  Modeled on PolyFit.
        '''
        frac: float = 0.2  # Mysterious incantation to make the argument work.
        def _fit(self, data):
            self.frac = min(self.frac, 1.0)
            x = data["x"]
            y = data["y"]
            yy = sm.nonparametric.lowess(exog=x, endog=y, frac=self.frac)
            df = pd.DataFrame(data = yy, columns = ("x", "y") )

            return df

        # TODO we should have a way of identifying the method that will be applied
        # and then only define __call__ on a base-class of stats with this pattern

        def __call__(self, data, groupby, orient, scales):

            return (
                groupby
                .apply(data.dropna(subset=["x", "y"]), self._fit)
            )
    """)

