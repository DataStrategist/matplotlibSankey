import matplotlib.pyplot as plt
from matplotlib.sankey import Sankey
def fun(ddf, fig_title):
  someSink = Sankey(flows =ddf["flows"], labels = ddf["labels"], orientations = ddf["orientations"]).finish()
  plt.title(fig_title)
  plt.show()


def fun3(ddf, x, settings_scale, settings_offset, settings_head_angle, settings_format, 
       settings_unit, fig_title, sankey_label, sankey_color, center_text_bold):
  fig = plt.figure()
  ax = fig.add_subplot(1, 1, 1, xticks=[], yticks=[],
                       title=fig_title)
  sankey = Sankey(ax=ax, scale=0.01, offset=0.2, head_angle=90, format='%.0f', unit='%')
  sankey.add(flows=ddf["flows"], labels=ddf["labels"], orientations=ddf["orientations"], pathlengths=ddf["pathlengths"],
             patchlabel=sankey_label)  # Arguments to matplotlib.patches.PathPatch
  diagrams = sankey.finish()
  colors = ddf["colors"]
  for i in range(0,len(diagrams[0].texts)):
    diagrams[0].texts[i].set_color(colors[i])
  
  if center_text_bold:
    diagrams[0].text.set_fontweight('bold')
  if sankey_color != False:
    diagrams[0].patch.set_color(sankey_color)
  plt.show()
