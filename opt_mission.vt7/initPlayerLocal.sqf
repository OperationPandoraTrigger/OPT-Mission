if(!(isnil "a3uf_common_fnc_request")) 

then
{

    maphandler = addMissionEventHandler [ "Map", {   
            params ["_mapIsOpened","_mapIsForced"];
            url = "127.0.0.1:4445/call/SetSceneItemRender";
            headers = [];
            postData  = "";
            if (_mapIsOpened) then {
                postData = '{ "source": "Quellenspiegel", "render":  true}';
            } else {
                postData = '{ "source": "Quellenspiegel", "render":  false}';
            };
            private _response = [
                    url,
                    "POST",
                    headers,
                    postData,
                    false
                ] spawn a3uf_common_fnc_request;
        }];

};
