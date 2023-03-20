use [Spend Analytics]

SELECT * FROM Purchase_Order_History

SELECT (convert(date, PO.PO_Date)) as PO_Date,PO.PO_Number,PO.Item_ID,PO.Item_Description,PO.Manufacturer_Name,PO.Vendor_Name,PO.Department,PO._Unit_Price______,PO.Unit_Of_Measure,PO.Quantity__at_UOM_,PO.Total_Price____,VM.Vendor_ID,VM.Vendor_Name,VM.Active_Status 
FROM Purchase_Order_History PO JOIN Vendor_Master VM ON PO.Vendor_Name = VM.Vendor_Name

SELECT PO.PO_Date,PO.PO_Number,PO.Item_ID,PO.Item_Description,PO.Manufacturer_Name,PO.Vendor_Name,PO.Department,
PO._Unit_Price______,PO.Unit_Of_Measure,PO.Quantity__at_UOM_,PO.Total_Price____,VM.Vendor_ID,VM.Vendor_Name,VM.Active_Status,
CH.Contract_ID,CH.Contract_Description,CH.Contract_Type,CH.Start_Date,CH.End_Date 
FROM Purchase_Order_History PO JOIN Vendor_Master VM ON PO.Vendor_Name = VM.Vendor_Name JOIN Contract_Headers CH ON VM.Vendor_Name = CH.Vendor_Name

SELECT PO.PO_Date,PO.PO_Number,PO.Item_ID,PO.Item_Description,PO.Manufacturer_Name,PO.Vendor_Name,PO.Department,
PO._Unit_Price______,PO.Unit_Of_Measure,PO.Quantity__at_UOM_,PO.Total_Price____,VM.Vendor_ID,VM.Vendor_Name,VM.Active_Status,
CH.Contract_ID,CH.Contract_Description,CH.Contract_Type,CH.Start_Date,CH.End_Date,CIL.Contract_Price_Million_,CIL.Contract_UOM 
FROM Purchase_Order_History PO JOIN Vendor_Master VM ON PO.Vendor_Name = VM.Vendor_Name 
JOIN Contract_Headers CH ON VM.Vendor_Name = CH.Vendor_Name
JOIN [Contract Item Lines] CIL ON PO.Item_ID = CIL.Item_ID


SELECT (convert(date, PO.PO_Date)) as PO_Date,PO.PO_Number,PO.Item_ID,PO.Item_Description,PO.Department,
PO._Unit_Price______,PO.Unit_Of_Measure,PO.Quantity__at_UOM_,PO.Total_Price____,VM.Vendor_ID,VM.Vendor_Name,VM.Active_Status,
CH.Contract_ID,CH.Contract_Description,CH.Contract_Type,(convert(date, CH.Start_Date)) as Contract_StartDate,(convert(date, CH.End_Date)) as Contract_EndDate,
CIL.Contract_Price_Million_,CIL.Contract_UOM,
IM.Manufacturer_Name,IM.Manufacturer_ID,IM.Lowest_Unit_Of_Measure,IM.Purchasing_Unit_Of_Measure,IM.Quantity 
FROM Purchase_Order_History PO JOIN Vendor_Master VM ON PO.Vendor_Name = VM.Vendor_Name 
JOIN Contract_Headers CH ON VM.Vendor_Name = CH.Vendor_Name
JOIN [Contract Item Lines] CIL ON PO.Item_ID = CIL.Item_ID
JOIN Item_Master IM ON PO.Item_ID = IM.Item_ID


SELECT (convert(date, PO.PO_Date)) as PO_Date,PO.PO_Number,PO.Item_ID,PO.Item_Description,IM.Manufacturer_Name,IM.Manufacturer_ID,
IM.Lowest_Unit_Of_Measure,IM.Purchasing_Unit_Of_Measure,
VM.Vendor_Name,VM.Vendor_ID,VM.Vendor_City,VM.Active_Status,
CH.Contract_ID,CH.Contract_Description,CH.Contract_Type,(convert(date, CH.Start_Date)) as Contract_StartDate,(convert(date, CH.End_Date)) as Contract_EndDate,
CIL.Contract_Price_Million_,CIL.Contract_UOM,
PO.Unit_Of_Measure,IM.Quantity,PO.Quantity__at_UOM_,
PO._Unit_Price______,PO.Total_Price____,PO.Department
FROM Purchase_Order_History PO JOIN Vendor_Master VM ON PO.Vendor_Name = VM.Vendor_Name 
JOIN Contract_Headers CH ON VM.Vendor_Name = CH.Vendor_Name
JOIN [Contract Item Lines] CIL ON PO.Item_ID = CIL.Item_ID
JOIN Item_Master IM ON PO.Item_ID = IM.Item_ID