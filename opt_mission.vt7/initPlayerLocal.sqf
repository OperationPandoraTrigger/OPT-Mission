// Automatisches Karten-Blurring für Streamer
// https://github.com/OperationPandoraTrigger/OPT-Server-Mod/issues/200

if(!(isnil "a3uf_common_fnc_request")) then
{
    addMissionEventHandler [ "Map",
    {
        params ["_mapIsOpened", "_mapIsForced"];
        private "_postData";

        if (_mapIsOpened) then
        {
            _postData = '{"source": "Quellenspiegel", "render":  true}';
        }
        else
        {
            _postData = '{"source": "Quellenspiegel", "render":  false}';
        };

        [
            "127.0.0.1:4445/call/SetSceneItemRender",
            "POST",
            [],
            _postData,
            false
        ] spawn a3uf_common_fnc_request;
    }];
};
