package Model;

public class ResultEntity {
	private boolean _ok;
	private String _msg;
	private String _data;
	private int _cnt;
	public boolean is_ok() {
		return _ok;
	}
	public void set_ok(boolean _ok) {
		this._ok = _ok;
	}
	public String get_msg() {
		return _msg;
	}
	public void set_msg(String _msg) {
		this._msg = _msg;
	}

	public String get_data() {
		return _data;
	}
	public void set_data(String _data) {
		this._data = _data;
	}

	public int get_cnt() {
		return _cnt;
	}
	public void set_cnt(int _data) {
		this._cnt = _data;
	}
	
	
	public String toString()
	{
		return "{\"IsOK\":"+ this.is_ok() +",\"Data\":"+ this.get_data() +",\"Msg\":\""+ this.get_msg() +"\",\"Cnt\":\""+ this.get_cnt() +"\"}";
	}
}
