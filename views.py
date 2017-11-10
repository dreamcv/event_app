from django.shortcuts import render
from django.contrib.auth.views import login_required
from django.http import HttpResponse
# Create your views here.
from django.http import HttpResponse, JsonResponse
import pymysql


DB_CONFIG = {
    'host': '127.0.0.1',
    'port': 3306,
    'user': 'root',
    'password': '112233..',
    'db': 'qlsj1108',
    'charset': 'utf8',
    'cursorclass': pymysql.cursors.DictCursor,
}

def from_sql_get_data(sql):
    # Connect to the database
    connection = pymysql.connect(**DB_CONFIG)
    corsor = connection.cursor()
    corsor.execute(sql)
    res = corsor.fetchall()
    data = {"data": res, "heads": [x[0] for x in corsor.description]}
    corsor.close()
    connection.close()
    return data


def main_json(request, sql):
    try:
        data = from_sql_get_data(sql)
    except :
        pass
    return JsonResponse(data)


def gaim_json(request):
    sql = """
    select  concat('<a href=\"/warning_detail/', event_eventbase.id, '/\">', 
                  event_eventbase.event_src, '</a>') as src,
            event_eventbase.to_server, 
            event_eventbase.port,
            event_eventbase.happened_date,
            event_eventcate.cate from event_eventbase
      left join event_eventcate 
      on event_eventcate.id = event_eventbase.event_cate_id;
    """
    return main_json(request, sql)


## 获取 event_detail 传入 event_id 后 event_detail 中该事件的所有情况。
def get_details(event_id):
    sql = """ select event.*, ed.st from 
                      (select event_eventbase.*, event_eventcate.cate  from event_eventbase 
                          left join event_eventcate 
                           on event_eventcate.id = event_eventbase.event_cate_id
                       ) as event
                     right join 
                          (select event_eventdetail.*, stat.st from event_eventdetail 
    							left join 
    							  (select event_stat.id as stat_id, event_stations.station as st from event_stat 
    							      join event_stations 
    							      on event_stat.stat_id = event_stations.id
    							   ) as stat 
    							on stat.stat_id = event_eventdetail.event_stat_id 
    						  where event_eventdetail.is_seen = 0
    					  ) as ed 
                    on event.id = ed.event_id where event_id={};
        """.format(event_id)
    data = from_sql_get_data(sql)
    return data


## 获取 event_detail 传入 event_id 后 event_detail 中该事件的所有情况。
def get_all_details():
    sql = """ select event.*, ed.st from 
                      (select event_eventbase.*, event_eventcate.cate  from event_eventbase 
                          left join event_eventcate 
                           on event_eventcate.id = event_eventbase.event_cate_id
                       ) as event
                     right join 
                          (select event_eventdetail.*, stat.st from event_eventdetail 
    							left join 
    							  (select event_stat.id as stat_id, event_stations.station as st from event_stat 
    							      join event_stations 
    							      on event_stat.stat_id = event_stations.id
    							   ) as stat 
    							on stat.stat_id = event_eventdetail.event_stat_id 
    						  where event_eventdetail.is_seen = 0
    					  ) as ed 
                    on event.id = ed.event_id;
        """
    data = from_sql_get_data(sql)
    return data


def test_json(requset):
    return JsonResponse(get_details(2))


@login_required
def homepage(request):
    return render(request, "event/index.html", {})


def warning_index(request):
    res = get_all_details()
    return render(request, "event/warning.html", {"datas": res["data"]})


def warning_detail(request):
    return render(request, "event/event_detail.html", {})


def event_detail(request, e_id):
    data = get_details(int(e_id))
    # print(data)
    ## 增加一条 Detail 记录 is_seen=1,

    return render(request, "event/event_detail.html", {"res": data, "e_id": e_id})

def event_desolve(request):
    extra_add = request.GET["extra"]




    return HttpResponse("Secess存储")

