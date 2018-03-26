    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script src="assets/js/skins.min.js"></script>

    <!-- Page Related Scripts -->
    <!-- Note: FullCalendar scripts and call must be added to header -->
    <script src='assets/js/fullcalendar/moment.min.js'></script>
    <script src='assets/js/jquery.min.js'></script>
    <script src='assets/js/fullcalendar/jquery-ui.custom.min.js'></script>
    <script src='assets/js/fullcalendar/fullcalendar.min.js'></script>
    <script src='js/template/lang-all.js'></script>
    <script>
	
	
	
	
        $(document).ready(function () {
			var data_a, data_m, isFirst			
            /* initialize the external events
            -----------------------------------------------------------------*/
            $('#external-events .external-event').each(function () {

                // store data so the calendar knows to render an event upon drop
                $(this).data('event', {
                    title: $.trim($(this).text()), // use the element's text as the event title
                    stick: true // maintain when user navigates (see docs on the renderEvent method)
                });

                // make the event draggable using jQuery UI
                $(this).draggable({
                    zIndex: 999,
                    revert: true,      // will cause the event to go back to its
                    revertDuration: 0  //  original position after the drag
                });

            });
            /* initialize the calendar
            -----------------------------------------------------------------*/
            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();
			
			
			
			
			
            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaDay'
                },
                
                droppable: true, // this allows things to be dropped onto the calendar
				lang: 'pt-br',
				editable: false,
				eventStartEditable: true,
				eventDurationEditable: false,
				eventLimit: true,
                events: [
				
				<%
					dim isFirst, qtde, countI				
					Do while not agendamentos.eof					
					set DetalheAgendamentos = getDetalheAgendamentos_Agenda(agendamentos("cod_Agendamento"))
					isFirst = True
					countI = 0
					set qtde = cn.execute("SELECT COUNT(cod_agendamento) as Quantidade FROM Detalhe_Agendamento WHERE Cod_Agendamento = " & agendamentos("cod_Agendamento"))
					do while not DetalheAgendamentos.eof							
						if not isNull(DetalheAgendamentos("Data_Inicial")) Then
							Dim dia, mes, ano, dia_f, mes_f, ano_f
							dia = day(DetalheAgendamentos("Data_Inicial"))
							mes = month(DetalheAgendamentos("Data_Inicial"))
							ano = year(DetalheAgendamentos("Data_Inicial"))
							dia_f = day(DetalheAgendamentos("Data_Final"))
							mes_f = month(DetalheAgendamentos("Data_Final"))
							ano_f = year(DetalheAgendamentos("Data_Final"))
							
							Dim hora, minuto, hora_f, minuto_f
							hora = hour(DetalheAgendamentos("Data_Inicial"))
							minuto = minute(DetalheAgendamentos("Data_Inicial"))
							hora_f = hour(DetalheAgendamentos("Data_Final"))
							minuto_f = minute(DetalheAgendamentos("Data_Final"))
																					
							if len(dia) = 1 then
								dia = "0" & dia  
							end if
							
							if len(mes) = 1 then
								mes = "0" & mes
							end if
							
							if len(minuto) = 1 then
								minuto = "0" & minuto
							end if
							
							if len(hora) = 1 then
								hora = "0" &  hora
							end if
							
							if len(dia_f) = 1 then
								dia_f = "0" & dia_f  
							end if
							
							if len(mes_f) = 1 then
								mes_f = "0" & mes_f
							end if
							
							if len(minuto_f) = 1 then
								minuto_f = "0" & minuto_f
							end if
							
							if len(hora_f) = 1 then
								hora_f = "0" &  hora_f
							end if
							
							'detalheAgendamentos = getDetalheAgendamentos(agendamentos("Cod_Agendamento"))
							servicos = getServicos(DetalheAgendamentos("Cod_Servico"))
							veiculo = getVeiculos(DetalheAgendamentos("Cod_Veiculo"))
				%>					
					{
						id: <%=agendamentos("Cod_Agendamento")%>,
						title: '<%=DetalheAgendamentos("placa")%>' + ' ' + '<%=servicos("Descricao")%>',
						start: '<%=ano & "-" & mes & "-" & dia & "T" & hora & ":" & minuto%>',
						end: '<%=ano_f & "-" & mes_f & "-" & dia_f & "T" & hora_f & ":" & minuto_f%>',
						cliente: '<%=agendamentos("Nome_Cliente")%>',
						placa: '<%=DetalheAgendamentos("placa")%>',
						isFirst: '<%=isFirst%>',
						isLast: 'False',
						servico: '<%=servicos("Descricao")%>',	
						veiculo: '<%=veiculo("Modelo")%>',
						email: '<%=agendamentos("Email")%>',
						status: '<%=agendamentos("status")%>'
					},
						
				<%
						isFirst = False						
						countI = countI + 1 
						if countI = qtde("quantidade") then%>
						{
							id: <%=agendamentos("Cod_Agendamento")%>,
							title: 'Finalizar: <%=detalheAgendamentos("placa")%>',
							start: '<%=ano & "-" & mes & "-" & dia & "T" & hora & ":" & minuto+1%>',
							isFirst: 'False',
							isLast: 'True',
							status: '<%=agendamentos("status")%>',
							color: 'red',
							data_finalizacao: '<%=agendamentos("data_finalizacao")%>',							                                    
							user_finalizacao: '<%=agendamentos("Nome_Usuario")%>'
						},
						<%
						end if
						end if																
					DetalheAgendamentos.movenext					
					loop
				agendamentos.movenext
				Loop%>
				
				
                ],		
				eventDrop: function(event,delta, revertFunc){
					var servico_ = event.title;
					var id_ = event.id;
					var data_ = event.start.format();
					var placa_ = event.placa;
					var cliente = event.cliente
					var email_ = event.email
					data_m = event.start.format();
					
					if (!(event.isFirst == "True")) {
						alert('Selecione o primeiro horario agendado deste grupo');
						revertFunc();	
					}else{
											
						if(! confirm ("Deseja realmente mudar o agendamento?")) {
							revertFunc ();
						}else{
							
							if (cliente == '') {
								cliente = 'Compra sem cadastro';
							}
							
							if (email_ == ''){
								email_ = 'Compra sem cadastro';	
							}
							
							$.post('./ajax/agendamento.asp',
							{ 
								data: data_, 
								codAgendamento: id_,
								placa: placa_,
								nomeCliente: cliente,
								email: email_
								
							},
							function(data, status){								
								if(data == "OK") {
									$('#calendar').fullCalendar('refetchEvents');	
									alert('Serviço(s) remarcado(s)');
								}
							
							});	
						}
						
					}
					
					//alert(data_a);
					//alert(data_m);
//					alert(servico_ + " será remanejado para " + data_);					
				},
				eventDragStop: function( event, jsEvent, ui, view ) { 
					data_a = event.start.format()
				},		
				
				eventClick: function(event, jsEvent, View){					
					var id_ = event.id;					
					var placa_ = event.placa;
					var cliente = event.cliente
					var email_ = event.email
										
					if (cliente == '') {
						cliente = 'Compra sem cadastro';
					}
					
					if (event.isLast == "True") {
						if(event.status == 0 ){	
							if(confirm("Deseja finalizar o(s) serviço(s) deste cliente?")){
								$.post('./ajax/finalizar.asp',
								{ 								
									codAgendamento: id_,
									placa: placa_,
									nomeCliente: cliente,
									email: email_	
								},
								function(data, status){
									var arr = data.split(',')									
									if(arr[0] == "OK") {
										alert('Serviço(s) Finalizado(s)');
										event.status = 1										
										event.user_finalizacao = arr[1]
										event.data_finalizacao = arr[2]
										$('#calendar').fullCalendar('refetchEvents');	
									}
								});	
							}
						}else{
							alert("Serviço(s) finalizado(s) as " + event.data_finalizacao + " por: " + event.user_finalizacao)
						}
					}else {
						alert('Serviço: ' + event.servico + '\nCliente: ' + cliente + '\nVeiculo: ' + event.veiculo + '\nPlaca: ' + event.placa);
						//alert("Você clicou  no agendamento: " + event.title); 	
					}
					
				}
				
				
            });


        });
    </script>

            <!-- Page Content -->
            <div class="page-content">
                <!-- Page Breadcrumb -->
                <div class="page-breadcrumbs">
                    <ul class="breadcrumb">
                        <li>
                            <i class="fa fa-home"></i>
                            <a href="#">Home</a>
                        </li>
                        <li class="active">Calendar</li>
                    </ul>
                </div>
                <!-- /Page Breadcrumb -->
                <!-- Page Header -->
                <div class="page-header position-relative">
                    <div class="header-title">
                        <h1>
                            Full Calendar
                        </h1>
                    </div>
                    <!--Header Buttons-->
                    <div class="header-buttons">
                        <a class="sidebar-toggler" href="#">
                            <i class="fa fa-arrows-h"></i>
                        </a>
                        <a class="refresh" id="refresh-toggler" href="">
                            <i class="glyphicon glyphicon-refresh"></i>
                        </a>
                        <a class="fullscreen" id="fullscreen-toggler" href="#">
                            <i class="glyphicon glyphicon-fullscreen"></i>
                        </a>
                    </div>
                    <!--Header Buttons End-->
                </div>
                <!-- /Page Header -->
                <!-- Page Body -->
                <div class="page-body">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            
                            </div>
                        </div>
                        <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                            <div class="widget flat">
                                <div class="widget-header bordered-bottom bordered-sky">
                                    <i class="widget-icon fa fa-calendar sky"></i>
                                    <span class="widget-caption">Events and Schedules</span>
                                </div><!--Widget Header-->
                                <div class="widget-body">
                                    <div id='calendar'></div>
                                </div><!--Widget Body-->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Page Body -->
            </div>
            <!-- /Page Content -->
        

    <!--Basic Scripts-->
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/slimscroll/jquery.slimscroll.min.js"></script>

    <!--Beyond Scripts-->
    <script src="assets/js/beyond.min.js"></script>

<%


%>
    

