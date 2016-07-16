$(document).ready(function()
{
	// 监听window的加载时间,
	$(window).on("load",function()
		{
			imgloadLocation();
			var dataImg = {"data":[{"src":"pubu.jpg"},{"src":"pubu2.jpg"},{"src":"pubu3.jpg"},{"src":"pubu7.jpg"},{"src":"pubu6.jpg"},{"src":"pubu5.jpg"},{"src":"pubu4.jpg"},{"src":"pubu3.jpg"}]};
//监听鼠标的滚动事件，什么时间进行加载（大概在最后一张图片一半的时候进行添加）
			window.onscroll=function(){
				if(scrollside())
				{
					$.each(dataImg.data,function(index,value){
								var box = $("<div>").addClass("box").appendTo($("#zhuti"));
								var content = $("<div>").addClass("content").appendTo(box);
								$("<img>").attr("src","./img/"+$(value).attr("src")).appendTo(content);
					});
					imgloadLocation();
				}


			}


		});

//滚动加载
function scrollside(){
			var box = $(".box");
			//从屏幕上方到最后一张图片一半的高度
			var lastboxHeight=box.last().get(0).offsetTop+Math.floor(box.last().height()/2);
			console.log(lastboxHeight);
			var documentHeight = $(document).width();
			//滚动条滚动的距离
			var scrollHeight = $(window).scrollTop();
			//如果从屏幕上方到最后一张图片的高度小于屏幕的宽度加上滚动的距离 就加载
			return (lastboxHeight<(scrollHeight+documentHeight))?true:false;	


}



// 图片摆放的位置
function imgloadLocation()
{
	var box = $(".box");
	// 获取第一张图片的宽度
	var boxWidth = box.eq(0).width();
	// 获得一行能放置图片的个数，将其转换为整数
	var num = Math.floor($(window).width()/boxWidth);
   
   var boxArr=[];
   // value代表哪一个,value代表具体的对象
   box.each(function(index,value){
   	//获取每一个盒子的高度
   		var boxHeight = box.eq(index).height();

   		if(index<num)
   		{
   			boxArr [index]= boxHeight;
   			//console.log(index);
   		}
   		else
   		{
   			// 获取最小盒子的高度
   			var minboxHeight = Math.min.apply(null,boxArr);
   			//获取最小高度图片所在的位置
   			var minboxindex = $.inArray(minboxHeight,boxArr);

   			$(value).css({
   				"position":"absolute",
   				"top":minboxHeight,
   				"left":box.eq(minboxindex).position().left});

   			boxArr[minboxindex]+=box.eq(index).height();





   		}



   });


}



});