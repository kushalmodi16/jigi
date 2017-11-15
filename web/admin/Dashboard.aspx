<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="main-grid">

        <div class="social grid">
            <div class="grid-info">
                <div class="col-md-3 top-comment-grid">
                    <div class="comments likes">
                        <div class="comments-icon">
                            <i class="fa fa-facebook"></i>
                        </div>
                        <div class="comments-info likes-info">
                            <h3>95K</h3>
                            <a href="#">Likes</a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-3 top-comment-grid">
                    <div class="comments">
                        <div class="comments-icon">
                            <i class="fa fa-comments"></i>
                        </div>
                        <div class="comments-info">
                            <h3>12K</h3>
                            <a href="#">Comments</a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-3 top-comment-grid">
                    <div class="comments tweets">
                        <div class="comments-icon">
                            <i class="fa fa-twitter"></i>
                        </div>
                        <div class="comments-info tweets-info">
                            <h3>27K</h3>
                            <a href="#">Tweets</a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-3 top-comment-grid">
                    <div class="comments views">
                        <div class="comments-icon">
                            <i class="fa fa-eye"></i>
                        </div>
                        <div class="comments-info views-info">
                            <h3>557K</h3>
                            <a href="#">Views</a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>

        <div class="agile-grids">
            <div class="col-md-4 charts-right">
                <!-- area-chart -->
                <div class="area-grids">
                    <div class="area-grids-heading">
                        <h3>Area charts</h3>
                    </div>
                    <div id="graph4"></div>
                    <script>
                        Morris.Donut({
                            element: 'graph4',
                            data: [
                              { value: 70, label: 'foo', formatted: 'at least 70%' },
                              { value: 15, label: 'bar', formatted: 'approx. 15%' },
                              { value: 10, label: 'baz', formatted: 'approx. 10%' },
                              { value: 5, label: 'A really really long label', formatted: 'at most 5%' }
                            ],
                            formatter: function (x, data) { return data.formatted; }
                        });
                    </script>

                </div>
                <!-- //area-chart -->
            </div>
            <div class="col-md-8 chart-left">
                <!-- updating-data -->
                <div class="agile-Updating-grids">
                    <div class="area-grids-heading">
                        <h3>Updating data</h3>
                    </div>

                  <%--  <asp:Chart ID="Chart1" runat="server" Width="600" Height="400">
                        <series>
                    <asp:Series Name="Series1" XValueMember="0" YValueMembers="1">
                </asp:Series>
            </series>
                        <chartareas>
                <asp:ChartArea Name="ChartArea1">
                     <AxisY Title="ProductQuantity" Minimum="0" Maximum="100" Interval="10">
    </AxisY>
     <AxisX Title="Discount" Minimum="0" Maximum="100" Interval="10">
               
      </AxisX>
                     <Area3DStyle Enable3D="True"  LightStyle="Realistic" Rotation="20" WallWidth="5"/>
                </asp:ChartArea>
            </chartareas>
                    </asp:Chart>--%>
                   
                   
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="agile-bottom-grids">
                <div class="col-md-6 agile-bottom-right">
                    <div class="agile-bottom-grid">
                        <div class="area-grids-heading">
                            <h3>Stacked Bars chart</h3>
                        </div>
                        <div id="graph6"></div>
                        <script>
                            // Use Morris.Bar
                            Morris.Bar({
                                element: 'graph6',
                                data: [
                                  { x: '2011 Q1', y: 0 },
                                  { x: '2011 Q2', y: 1 },
                                  { x: '2011 Q3', y: 2 },
                                  { x: '2011 Q4', y: 3 },
                                  { x: '2012 Q1', y: 4 },
                                  { x: '2012 Q2', y: 5 },
                                  { x: '2012 Q3', y: 6 },
                                  { x: '2012 Q4', y: 7 },
                                  { x: '2013 Q1', y: 8 }
                                ],
                                xkey: 'x',
                                ykeys: ['y'],
                                labels: ['Y'],
                                barColors: function (row, series, type) {
                                    if (type === 'bar') {
                                        var red = Math.ceil(255 * row.y / this.ymax);
                                        return 'rgb(' + red + ',0,0)';
                                    }
                                    else {
                                        return '#000';
                                    }
                                }
                            });
                        </script>
                    </div>
                </div>
                <div class="col-md-6 agile-bottom-left">
                    <div class="agile-bottom-grid">
                        <div class="area-grids-heading">
                            <h3>Stacked Bars chart</h3>
                        </div>
                        <div id="graph5"></div>
                        <script>
                            // Use Morris.Bar
                            Morris.Bar({
                                element: 'graph5',
                                data: [
                                  { x: '2011 Q1', y: 3, z: 2, a: 3 },
                                  { x: '2011 Q2', y: 2, z: null, a: 1 },
                                  { x: '2011 Q3', y: 0, z: 2, a: 4 },
                                  { x: '2011 Q4', y: 2, z: 4, a: 3 }
                                ],
                                xkey: 'x',
                                ykeys: ['y', 'z', 'a'],
                                labels: ['Y', 'Z', 'A'],
                                stacked: true
                            });
                        </script>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="agile-last-grids">
                <div class="col-md-4 agile-last-left">
                    <div class="agile-last-grid">
                        <div class="area-grids-heading">
                            <h3>Daylight savings time</h3>
                        </div>
                        <div id="graph7"></div>
                        <script>
                            // This crosses a DST boundary in the UK.
                            Morris.Area({
                                element: 'graph7',
                                data: [
                                  { x: '2013-03-30 22:00:00', y: 3, z: 3 },
                                  { x: '2013-03-31 00:00:00', y: 2, z: 0 },
                                  { x: '2013-03-31 02:00:00', y: 0, z: 2 },
                                  { x: '2013-03-31 04:00:00', y: 4, z: 4 }
                                ],
                                xkey: 'x',
                                ykeys: ['y', 'z'],
                                labels: ['Y', 'Z']
                            });
                        </script>

                    </div>
                </div>
                <div class="col-md-4 agile-last-left agile-last-middle">
                    <div class="agile-last-grid">
                        <div class="area-grids-heading">
                            <h3>Daylight savings time</h3>
                        </div>
                        <div id="graph8"></div>
                        <script>
                            /* data stolen from http://howmanyleft.co.uk/vehicle/jaguar_'e'_type */
                            var day_data = [
                              { "period": "2012-10-01", "licensed": 3407, "sorned": 660 },
                              { "period": "2012-09-30", "licensed": 3351, "sorned": 629 },
                              { "period": "2012-09-29", "licensed": 3269, "sorned": 618 },
                              { "period": "2012-09-20", "licensed": 3246, "sorned": 661 },
                              { "period": "2012-09-19", "licensed": 3257, "sorned": 667 },
                              { "period": "2012-09-18", "licensed": 3248, "sorned": 627 },
                              { "period": "2012-09-17", "licensed": 3171, "sorned": 660 },
                              { "period": "2012-09-16", "licensed": 3171, "sorned": 676 },
                              { "period": "2012-09-15", "licensed": 3201, "sorned": 656 },
                              { "period": "2012-09-10", "licensed": 3215, "sorned": 622 }
                            ];
                            Morris.Bar({
                                element: 'graph8',
                                data: day_data,
                                xkey: 'period',
                                ykeys: ['licensed', 'sorned'],
                                labels: ['Licensed', 'SORN'],
                                xLabelAngle: 60
                            });
                        </script>
                    </div>
                </div>
                <div class="col-md-4 agile-last-left agile-last-right">
                    <div class="agile-last-grid">
                        <div class="area-grids-heading">
                            <h3>Daylight savings time</h3>
                        </div>
                        <div id="graph9"></div>
                        <script>
                            var day_data = [
                              { "elapsed": "I", "value": 34 },
                              { "elapsed": "II", "value": 24 },
                              { "elapsed": "III", "value": 3 },
                              { "elapsed": "IV", "value": 12 },
                              { "elapsed": "V", "value": 13 },
                              { "elapsed": "VI", "value": 22 },
                              { "elapsed": "VII", "value": 5 },
                              { "elapsed": "VIII", "value": 26 },
                              { "elapsed": "IX", "value": 12 },
                              { "elapsed": "X", "value": 19 }
                            ];
                            Morris.Line({
                                element: 'graph9',
                                data: day_data,
                                xkey: 'elapsed',
                                ykeys: ['value'],
                                labels: ['value'],
                                parseTime: false
                            });
                        </script>

                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="agile-two-grids">
                <div class="col-md-6 weather">
                    <div class="weather-right">
                        <div class="weather-heading">
                            <h3>Weather Report</h3>
                        </div>
                        <ul>
                            <li>
                                <figure class="icons">
                                    <canvas id="partly-cloudy-day" width="60" height="60"></canvas>
                                </figure>
                                <h3>25 °C</h3>
                                <div class="clearfix"></div>
                            </li>
                            <li>
                                <figure class="icons">
                                    <canvas id="clear-day" width="40" height="40"></canvas>
                                </figure>
                                <div class="weather-text">
                                    <h4>WED</h4>
                                    <h5>27 °C</h5>
                                </div>
                                <div class="clearfix"></div>
                            </li>
                            <li>
                                <figure class="icons">
                                    <canvas id="snow" width="40" height="40"></canvas>
                                </figure>
                                <div class="weather-text">
                                    <h4>THR</h4>
                                    <h5>13 °C</h5>
                                </div>
                                <div class="clearfix"></div>
                            </li>
                            <li>
                                <figure class="icons">
                                    <canvas id="partly-cloudy-night" width="40" height="40"></canvas>
                                </figure>
                                <div class="weather-text">
                                    <h4>FRI</h4>
                                    <h5>18 °C</h5>
                                </div>
                                <div class="clearfix"></div>
                            </li>
                            <li>
                                <figure class="icons">
                                    <canvas id="cloudy" width="40" height="40"></canvas>
                                </figure>
                                <div class="weather-text">
                                    <h4>SAT</h4>
                                    <h5>15 °C</h5>
                                </div>
                                <div class="clearfix"></div>
                            </li>
                            <li>
                                <figure class="icons">
                                    <canvas id="fog" width="40" height="40"></canvas>
                                </figure>
                                <div class="weather-text">
                                    <h4>SUN</h4>
                                    <h5>11 °C</h5>
                                </div>
                                <div class="clearfix"></div>
                            </li>
                        </ul>
                        <script>
                            var icons = new Skycons({ "color": "#fcb216" }),
                                 list = [
                                   "partly-cloudy-day"
                                 ],
                                 i;

                            for (i = list.length; i--;)
                                icons.set(list[i], list[i]);
                            icons.play();
                        </script>
                        <script>
                            var icons = new Skycons({ "color": "#000" }),
                                 list = [
                                   "clear-night", "partly-cloudy-night", "cloudy", "clear-day", "sleet", "snow", "wind", "fog"
                                 ],
                                 i;

                            for (i = list.length; i--;)
                                icons.set(list[i], list[i]);
                            icons.play();
                        </script>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
</asp:Content>

