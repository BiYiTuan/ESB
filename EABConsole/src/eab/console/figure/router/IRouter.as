package eab.console.figure.router
{
//	import figure.ISerialize;
	
	import flash.geom.Point;
	
	public interface IRouter
	{
		function createPath():void;
		function setSourcePoint(sSP:Point):void;
		function setTargetPoint(sTP:Point):void;
		function getPathPoint():Array;
		function getRouterId():int;
		function outputAllInformation() :XML;
		function readInformationToFigure(info:XML):void;
	}
}