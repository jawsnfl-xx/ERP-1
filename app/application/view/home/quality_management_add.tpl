 {if $parameters['1'] neq '' }
<ul class="list-inline">
	<li><a href="?url=home/quality_management/add">add</a></li>
	<li><a href="?url=home/quality_management/add/step1">step1</a></li>
	<li><a href="?url=home/quality_management/add/step2">step2</a></li>
	<li><a href="?url=home/quality_management/add/step3">step3</a></li>
	<li><a href="?url=home/quality_management/add/summary">summary</a></li>
</ul>
{/if} {if $parameters['1'] eq '' }
<div class="page-header">
	<h1>Utwórz nowy formularz</h1>
</div>
<div class="progress progress-striped active">
	<div class="progress-bar" role="progressbar" aria-valuenow="45"
		aria-valuemin="0" aria-valuemax="100" style="width: 10%">
		<span class="sr-only">45% Complete</span>
	</div>
</div>

<div class="alert alert-success">
	<span class="glyphicon glyphicon-thumbs-up"></span> Wszystko działa
</div>
<div class="alert alert-warning">
	<span class="glyphicon glyphicon-thumbs-down"></span> Nie zrobiłeś do
	końca
</div>
<div class="alert alert-danger">
	<span class="glyphicon glyphicon-warning-sign"></span> bul i źle i rzal
</div>
<a class="btn btn-primary btn btn-block"
	href="?url=home/quality_management/add/step1"> Block level button</a>
{elseif $parameters['1'] eq 'step1' }
<p>
<div class="page-header">
	<h1>Utwórz nowy formularz</h1>
</div>
<div class="progress progress-striped active">
	<div class="progress-bar" role="progressbar" aria-valuenow="45"
		aria-valuemin="0" aria-valuemax="100" style="width: 10%">
		<span class="sr-only">45% Complete</span>
	</div>
</div>
<input class="form-control input-lg" type="text" placeholder="NAZWA">

<div>
	<label class="checkbox-inline"> <input type="checkbox"
		id="inlineCheckbox1" value="option1"> 1
	</label> <label class="checkbox-inline"> <input type="checkbox"
		id="inlineCheckbox2" value="option2"> 2
	</label> <label class="checkbox-inline"> <input type="checkbox"
		id="inlineCheckbox3" value="option3"> 3
	</label>
</div>
<input class="form-control input-lg" type="text"
	placeholder="PRZYDATNY INPUT 1">
<input class="form-control input-lg" type="text"
	placeholder="PRZYDATNY INPUT 2">
<input class="form-control input-lg" type="text"
	placeholder="PRZYDATNY INPUT 3">

<h3>Ilość pomiarów</h3>
<select class="form-control">
	<option>1</option>
	<option>2</option>
	<option>3</option>
	<option>4</option>
	<option>5</option>
	<option>6</option>
	<option>7</option>
	<option>8</option>
	<option>9</option>
	<option>10</option>
	<option>11</option>
	<option>12</option>
	<option>13</option>
	<option>14</option>
	<option>15</option>
	<option>16</option>
	<option>17</option>
	<option>18</option>
	<option>19</option>
	<option>20</option>
	<option>21</option>
	<option>22</option>
	<option>23</option>
	<option>24</option>
	<option>25</option>
	<option>26</option>
	<option>27</option>
	<option>28</option>
	<option>29</option>
	<option>30</option>
</select>
<h3>Ilość zakresów pomiarów</h3>
<select class="form-control">
	<option>1</option>
	<option>2</option>
	<option>3</option>
	<option>4</option>
	<option>5</option>
	<option>6</option>
	<option>7</option>
	<option>8</option>
	<option>9</option>
	<option>10</option>
	<option>11</option>
	<option>12</option>
	<option>13</option>
	<option>14</option>
	<option>15</option>
	<option>16</option>
	<option>17</option>
	<option>18</option>
	<option>19</option>
	<option>20</option>
	<option>21</option>
	<option>22</option>
	<option>23</option>
	<option>24</option>
	<option>25</option>
	<option>26</option>
	<option>27</option>
	<option>28</option>
	<option>29</option>
	<option>30</option>
</select>
<div class="alert alert-success">
	<span class="glyphicon glyphicon-thumbs-up"></span> Wszystko działa
</div>
<div class="alert alert-warning">
	<span class="glyphicon glyphicon-thumbs-down"></span> Nie zrobiłeś do
	końca
</div>
<div class="alert alert-danger">
	<span class="glyphicon glyphicon-warning-sign"></span> bul i źle i rzal
</div>
<a class="btn btn-primary btn btn-block"
	href="?url=home/quality_management/add/step1"> Block level button</a>
</p>
{elseif $parameters['1'] eq 'step2' }
<p>lol</p>
{elseif $parameters['1'] eq 'step3' }
<p>dupa dupa i 3 dupa</p>
{elseif $parameters['1'] eq 'summary' }
<p>dupa dupa i 8 cyceków dupa</p>
{/if}
