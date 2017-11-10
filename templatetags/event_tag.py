#!/usr/bin/env python
# encoding: utf-8
from django.core.urlresolvers import reverse
from django import template

register = template.Library()
from django.template.defaultfilters import stringfilter

@register.filter(name="shenfen")
def load_oauth_applications(User):
    from accounts.models import UserShenFen
    return UserShenFen.objects.get(webuser=User).shenfen


@register.filter(name="data2html")
def data2html(data):
    if int(data["port"]) < 500:
        string = """<!-- cate 4 -->
                <div class="alert alert-danger alert-dismissable">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
		
                  <h4>  <i class="icon fa fa-check"></i> """ + data["cate"] + """</h4>
                  """+ data["event_name"] + """
                  <p>
                    <a href = "/warning_detail/""" + str(data["id"]) + """/"> <button class="btn btn-outline" name='sign'>签收</button>
                  </p>
                </div>"""
        return string

    elif(int(data["port"]) < 1000):
        string = """				
                <div class="alert alert-info alert-dismissable">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                       <h4><i class="icon fa fa-info"></i>  """ + data["cate"] + """</h4>
                       """ + data["event_name"] + """
                       <p>
                         <a href = "/warning_detail/""" +str(data["id"])+ """/"> <button class="btn btn-outline" name='sign'>签收</button>
                       </p>
                     </div>"""
        return string


    elif(int(data["port"]) < 3500):
        string = """				
                <div class="alert alert-warning alert-dismissable">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                  <h4><i class="icon fa fa-warning"></i>""" + data["cate"] + """</h4>
                               """ + data["event_name"] + """
                               <p>
                                 <a href = "/warning_detail/""" + str(data["id"]) + """/"> <button class="btn btn-outline" name='sign'>签收</button>
                               </p>
                             </div>"""
        return string

    else:
        string = """<div class="alert alert-danger alert-dismissable">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                  <h4><i class="icon fa fa-ban"></i>""" + data["cate"] + """</h4>
                                       """ + data["event_name"] + """
                                       <p>
                                         <a href = "/warning_detail/""" + str(data["id"]) + """/"> <button class="btn btn-outline" name='sign'>签收</button>
                                       </p>
                                     </div>"""
        return string


