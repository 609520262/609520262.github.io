---
title: quick_start
date: 2023-03-08 20:35:48
---

{% raw %}


   <section data-toggle="wy-nav-shift" class="wy-nav-content-wrap"><nav class="wy-nav-top" aria-label="移动版导航菜单" >
          <i data-toggle="wy-nav-top" class="fa fa-bars"></i>
          <a href="../index.html">Entropy theory</a>
      </nav>

      <div class="wy-nav-content">
        <div class="rst-content">
          <div role="navigation" aria-label="页面导航">
  <ul class="wy-breadcrumbs">
      <li><a href="../index.html" class="icon icon-home"></a></li>
      <li class="breadcrumb-item active">快速上手熵值</li>
<li class="wy-breadcrumbs-aside">
   <a href="https://github.com/609520262/Deploy-static-content-to-Pages/tree/main/docs/index.rst" class="fa fa-github"> 在 GitHub 上编辑</a>
</li>

  </ul>
  <hr/>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
             
  <section id="id1">
<h1>快速上手熵值<a class="headerlink" href="#id1" title="此标题的永久链接"></a></h1>
<section id="id2">
<h2>工况仿真<a class="headerlink" href="#id2" title="此标题的永久链接"></a></h2>
<p>采用 <strong>MATLAB</strong> 生成不同工况，选取轴承参数如下表：</p>
<div class="admonition danger">
<p class="admonition-title">危险</p>
<p>这里需要加入MATLAB仿真的一些参数</p>
</div>
<p>仿真5种不同的工况，各工况对应指标如下：</p>
<div class="admonition danger">
<p class="admonition-title">危险</p>
<p>这里需要加入工况对应指标，下表是一个例子：</p>
</div>
<table class="docutils align-default">
<colgroup>
<col style="width: 14%" />
<col style="width: 21%" />
<col style="width: 34%" />
<col style="width: 14%" />
<col style="width: 7%" />
<col style="width: 10%" />
</colgroup>
<thead>
<tr class="row-odd"><th class="head"><p>编号</p></th>
<th class="head"><p>名称</p></th>
<th class="head"><p>NAND FLASH</p></th>
<th class="head"><p>eMMC</p></th>
<th class="head"><p>SD</p></th>
<th class="head"><p>USB</p></th>
</tr>
</thead>
<tbody>
<tr class="row-even"><td><p>1</p></td>
<td><p>CFG1-4</p></td>
<td><p>0</p></td>
<td><p>0</p></td>
<td><p>0</p></td>
<td><p>1</p></td>
</tr>
<tr class="row-odd"><td><p>2</p></td>
<td><p>CFG1-4</p></td>
<td><p>1</p></td>
<td><p>1</p></td>
<td><p>1</p></td>
<td><p>0</p></td>
</tr>
<tr class="row-even"><td><p>3</p></td>
<td><p>CFG1-4</p></td>
<td><p>1</p></td>
<td><p>0</p></td>
<td><p>0</p></td>
<td><p>X</p></td>
</tr>
<tr class="row-odd"><td><p>4</p></td>
<td><p>CFG1-5</p></td>
<td><p>0</p></td>
<td><p>1</p></td>
<td><p>0</p></td>
<td><p>X</p></td>
</tr>
<tr class="row-even"><td><p>5</p></td>
<td><p>CFG1-6</p></td>
<td><p>0</p></td>
<td><p>1</p></td>
<td><p>1</p></td>
<td><p>X</p></td>
</tr>
<tr class="row-odd"><td><p>6</p></td>
<td><p>CFG1-7</p></td>
<td><p>1</p></td>
<td><p>0</p></td>
<td><p>0</p></td>
<td><p>X</p></td>
</tr>
<tr class="row-even"><td><p>7</p></td>
<td><p>CFG2-3</p></td>
<td><p>0</p></td>
<td><p>1</p></td>
<td><p>0</p></td>
<td><p>X</p></td>
</tr>
<tr class="row-odd"><td><p>8</p></td>
<td><p>CFG2-5</p></td>
<td><p>0</p></td>
<td><p>0</p></td>
<td><p>1</p></td>
<td><p>X</p></td>
</tr>
</tbody>
</table>
</section>
<section id="id3">
<h2>熵值提取特征<a class="headerlink" href="#id3" title="此标题的永久链接"></a></h2>
<p>用熵值方法处理轴承或齿轮的不同工况的振动信号，提取故障特征 单尺度做脉冲检测；多尺度的结果做降维处理(t-sne)</p>
</section>
<section id="id4">
<h2>抗噪性分析<a class="headerlink" href="#id4" title="此标题的永久链接"></a></h2>
<p>这一部分选用经典的混沌信号逻辑映射，迭代式如下：</p>
<div class="math notranslate nohighlight">
\[{x_{n + 1}} = r{x_n}\left( {1 - {x_n}} \right),{x_0} = 0.1,n = 1,2,3, \ldots\]</div>
<p>取参数  <span class="math notranslate nohighlight">\(r = 3.7,3.8,3.9,4.0\)</span> ，构造四个复杂度不同的时间序列，长度均为2048。然后通过增加不同信噪比的高斯白噪声的方式评估熵值方法的抗噪能力。对任意时间序列，首先计算当SNR=30时的熵值作为基准，记为  <span class="math notranslate nohighlight">\({I_0}\)</span> 。然后将SNR从30减小到-10，步长为1，计算不同SNR时的熵值，记为 <span class="math notranslate nohighlight">\({I_1}\)</span>      。定义衡量抗噪能力的值为 <span class="math notranslate nohighlight">\(S = \frac{ { {I_1} - {I_0} } } { { {I_0}}}\)</span>  ，表示当噪声增大时熵值的变化程度。  <span class="math notranslate nohighlight">\(S\)</span>  越小则说明抗噪能力越好。</p>
</section>
<section id="id5">
<h2>计算效率分析<a class="headerlink" href="#id5" title="此标题的永久链接"></a></h2>
<p>这一部分将统计当时间序列的长度为64，128，256，512，1024，2048，4096时，熵值方法计算10次需要花费的时间。耗费时间越短说明计算效率越高。</p>
</section>
</section>


           </div>
          </div>
          <footer><div class="rst-footer-buttons" role="navigation" aria-label="页脚">
        <a href="install.html" class="btn btn-neutral float-left" title="安装说明" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left" aria-hidden="true"></span> 上一页</a>
        <a href="Entropy%20theory/1%20Approximate%20Entropy.html" class="btn btn-neutral float-right" title="近似熵(Approximate Entropy)" accesskey="n" rel="next">下一页 <span class="fa fa-arrow-circle-right" aria-hidden="true"></span></a>
    </div>

  <hr/>

  

</footer>
        </div>
      </div>
    </section>
    
	
	
	{% endraw %}
