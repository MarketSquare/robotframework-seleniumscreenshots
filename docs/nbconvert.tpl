{# usage: jupyter nbconvert --to html --TemplateExporter.exclude_input=True --TemplateExporter.exclude_input_prompt=True --TemplateExporter.exclude_output_prompt=True --TemplateExporter.template_file=nbconvert.tpl notebook.ipynb #}
{% extends 'full.tpl'%}
{% block any_cell %}
{% if cell['cell_type'] != 'code' %}
  {{ super() }}
{% elif cell['outputs']|length > 0 %}
  {# drop log and report links output: #}
  {{ cell['outputs'].pop(0) and super() }}
{% else %}
  {{ super() }}
{% endif %}
{% endblock any_cell %}
