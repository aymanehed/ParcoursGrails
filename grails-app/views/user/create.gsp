<%@ page import="com.mbds.parcours.Illustration" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<a href="#create-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="create-user" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.user}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form resource="${this.user}" method="POST">
        <fieldset class="form">
            <form action="/user/save" method="post">
                <fieldset class="form">
                    <div class="fieldcontain required">
                        <label for="password">Password
                            <span class="required-indicator">*</span>
                        </label><input type="password" name="password" required="" value="" id="password">
                    </div>

                    <div class="fieldcontain required">
                        <label for="username">Username
                            <span class="required-indicator">*</span>
                        </label><input type="text" name="username" value="" required="" id="username">
                    </div>

                    <div class="fieldcontain required">
                        <label for="email">Email
                            <span class="required-indicator">*</span>
                        </label><input type="email" name="email" value="" required="" id="email">
                    </div>

                    <div class="fieldcontain">
                        <label for="thumbnail">Thumbnail</label>
                        %{--                        <select name="thumbnail.id" id="thumbnail">--}%
                        <g:select name="thumbnail" from="${Illustration.list()}" optionKey="id" value="${user?.thumbnail?.name}"/>
                        %{--                            <option value="null"></option>--}%
                        %{--                            <option value="1">com.mbds.parcours.Illustration : 1</option>--}%
                        %{--                            <option value="2">com.mbds.parcours.Illustration : 2</option>--}%
                        %{--                            <option value="3">com.mbds.parcours.Illustration : 3</option>--}%
                        %{--                            <option value="4">com.mbds.parcours.Illustration : 4</option>--}%
                        %{--                            <option value="5">com.mbds.parcours.Illustration : 5</option>--}%
                        %{--                            <option value="6">com.mbds.parcours.Illustration : 6</option>--}%
                        %{--                            <option value="7">com.mbds.parcours.Illustration : 7</option>--}%
                        %{--                            <option value="8">com.mbds.parcours.Illustration : 8</option>--}%
                        %{--                            <option value="9">com.mbds.parcours.Illustration : 9</option>--}%
                        %{--                            <option value="10">com.mbds.parcours.Illustration : 10</option>--}%
                        %{--                            <option value="11">com.mbds.parcours.Illustration : 11</option>--}%
                        %{--                            <option value="12">com.mbds.parcours.Illustration : 12</option>--}%
                        %{--                            <option value="13">com.mbds.parcours.Illustration : 13</option>--}%
                        %{--                            <option value="14">com.mbds.parcours.Illustration : 14</option>--}%
                        %{--                            <option value="15">com.mbds.parcours.Illustration : 15</option>--}%
                        %{--                            <option value="16">com.mbds.parcours.Illustration : 16</option>--}%
                        %{--                            <option value="17">com.mbds.parcours.Illustration : 17</option>--}%
                        %{--                            <option value="18">com.mbds.parcours.Illustration : 18</option>--}%
                        %{--                            <option value="19">com.mbds.parcours.Illustration : 19</option>--}%
                        %{--                            <option value="20">com.mbds.parcours.Illustration : 20</option>--}%
                        %{--                            <option value="21">com.mbds.parcours.Illustration : 21</option>--}%
                        %{--                            <option value="22">com.mbds.parcours.Illustration : 22</option>--}%
                        %{--                            <option value="23">com.mbds.parcours.Illustration : 23</option>--}%
                        %{--                            <option value="24">com.mbds.parcours.Illustration : 24</option>--}%
                        %{--                            <option value="25">com.mbds.parcours.Illustration : 25</option>--}%
                        %{--                            <option value="26">com.mbds.parcours.Illustration : 26</option>--}%
                        %{--                            <option value="27">com.mbds.parcours.Illustration : 27</option>--}%
                        %{--                            <option value="28">com.mbds.parcours.Illustration : 28</option>--}%
                        %{--                            <option value="29">com.mbds.parcours.Illustration : 29</option>--}%
                        %{--                            <option value="30">com.mbds.parcours.Illustration : 30</option>--}%
                        %{--                            <option value="31">com.mbds.parcours.Illustration : 31</option>--}%
                        %{--                            <option value="32">com.mbds.parcours.Illustration : 32</option>--}%
                        %{--                            <option value="33">com.mbds.parcours.Illustration : 33</option>--}%
                        %{--                            <option value="34">com.mbds.parcours.Illustration : 34</option>--}%
                        %{--                            <option value="35">com.mbds.parcours.Illustration : 35</option>--}%
                        %{--                            <option value="36">com.mbds.parcours.Illustration : 36</option>--}%
                        %{--                            <option value="37">com.mbds.parcours.Illustration : 37</option>--}%
                        %{--                            <option value="38">com.mbds.parcours.Illustration : 38</option>--}%
                        %{--                            <option value="39">com.mbds.parcours.Illustration : 39</option>--}%
                        %{--                            <option value="40">com.mbds.parcours.Illustration : 40</option>--}%
                        %{--                            <option value="41">com.mbds.parcours.Illustration : 41</option>--}%
                        %{--                            <option value="42">com.mbds.parcours.Illustration : 42</option>--}%
                        %{--                            <option value="43">com.mbds.parcours.Illustration : 43</option>--}%
                        %{--                            <option value="44">com.mbds.parcours.Illustration : 44</option>--}%
                        %{--                            <option value="45">com.mbds.parcours.Illustration : 45</option>--}%
                        %{--                            <option value="46">com.mbds.parcours.Illustration : 46</option>--}%
                        %{--                            <option value="47">com.mbds.parcours.Illustration : 47</option>--}%
                        %{--                            <option value="48">com.mbds.parcours.Illustration : 48</option>--}%
                        %{--                            <option value="49">com.mbds.parcours.Illustration : 49</option>--}%
                        %{--                            <option value="50">com.mbds.parcours.Illustration : 50</option>--}%
                        %{--                            <option value="51">com.mbds.parcours.Illustration : 51</option>--}%
                        %{--                            <option value="52">com.mbds.parcours.Illustration : 52</option>--}%
                        %{--                            <option value="53">com.mbds.parcours.Illustration : 53</option>--}%
                        %{--                            <option value="54">com.mbds.parcours.Illustration : 54</option>--}%
                        %{--                            <option value="55">com.mbds.parcours.Illustration : 55</option>--}%
                        %{--                            <option value="56">com.mbds.parcours.Illustration : 56</option>--}%
                        %{--                            <option value="57">com.mbds.parcours.Illustration : 57</option>--}%
                        %{--                            <option value="58">com.mbds.parcours.Illustration : 58</option>--}%
                        %{--                            <option value="59">com.mbds.parcours.Illustration : 59</option>--}%
                        %{--                            <option value="60">com.mbds.parcours.Illustration : 60</option>--}%
                        %{--                            <option value="61">com.mbds.parcours.Illustration : 61</option>--}%
                        %{--                            <option value="62">com.mbds.parcours.Illustration : 62</option>--}%
                        %{--                            <option value="63">com.mbds.parcours.Illustration : 63</option>--}%
                        %{--                            <option value="64">com.mbds.parcours.Illustration : 64</option>--}%
                        %{--                            <option value="65">com.mbds.parcours.Illustration : 65</option>--}%
                        %{--                            <option value="66">com.mbds.parcours.Illustration : 66</option>--}%
                        %{--                            <option value="67">com.mbds.parcours.Illustration : 67</option>--}%
                        %{--                            <option value="68">com.mbds.parcours.Illustration : 68</option>--}%
                        %{--                            <option value="69">com.mbds.parcours.Illustration : 69</option>--}%
                        %{--                            <option value="70">com.mbds.parcours.Illustration : 70</option>--}%
                        %{--                            <option value="71">com.mbds.parcours.Illustration : 71</option>--}%
                        %{--                            <option value="72">com.mbds.parcours.Illustration : 72</option>--}%
                        %{--                            <option value="73">com.mbds.parcours.Illustration : 73</option>--}%
                        %{--                            <option value="74">com.mbds.parcours.Illustration : 74</option>--}%
                        %{--                            <option value="75">com.mbds.parcours.Illustration : 75</option>--}%
                        %{--                            <option value="76">com.mbds.parcours.Illustration : 76</option>--}%
                        %{--                            <option value="77">com.mbds.parcours.Illustration : 77</option>--}%
                        %{--                            <option value="78">com.mbds.parcours.Illustration : 78</option>--}%
                        %{--                            <option value="79">com.mbds.parcours.Illustration : 79</option>--}%
                        %{--                            <option value="80">com.mbds.parcours.Illustration : 80</option>--}%
                        %{--                            <option value="81">com.mbds.parcours.Illustration : 81</option>--}%
                        %{--                            <option value="82">com.mbds.parcours.Illustration : 82</option>--}%
                        %{--                            <option value="83">com.mbds.parcours.Illustration : 83</option>--}%
                        %{--                            <option value="84">com.mbds.parcours.Illustration : 84</option>--}%
                        %{--                            <option value="85">com.mbds.parcours.Illustration : 85</option>--}%
                        %{--                            <option value="86">com.mbds.parcours.Illustration : 86</option>--}%
                        %{--                            <option value="87">com.mbds.parcours.Illustration : 87</option>--}%
                        %{--                            <option value="88">com.mbds.parcours.Illustration : 88</option>--}%
                        %{--                            <option value="89">com.mbds.parcours.Illustration : 89</option>--}%
                        %{--                            <option value="90">com.mbds.parcours.Illustration : 90</option>--}%
                        %{--                            <option value="91">com.mbds.parcours.Illustration : 91</option>--}%
                        %{--                            <option value="92">com.mbds.parcours.Illustration : 92</option>--}%
                        %{--                            <option value="93">com.mbds.parcours.Illustration : 93</option>--}%
                        %{--                            <option value="94">com.mbds.parcours.Illustration : 94</option>--}%
                        %{--                            <option value="95">com.mbds.parcours.Illustration : 95</option>--}%
                        %{--                            <option value="96">com.mbds.parcours.Illustration : 96</option>--}%
                        %{--                            <option value="97">com.mbds.parcours.Illustration : 97</option>--}%
                        %{--                            <option value="98">com.mbds.parcours.Illustration : 98</option>--}%
                        %{--                            <option value="99">com.mbds.parcours.Illustration : 99</option>--}%
                        %{--                            <option value="100">com.mbds.parcours.Illustration : 100</option>--}%
                        %{--                            <option value="101">com.mbds.parcours.Illustration : 101</option>--}%
                        %{--                            <option value="102">com.mbds.parcours.Illustration : 102</option>--}%
                        %{--                            <option value="103">com.mbds.parcours.Illustration : 103</option>--}%
                        %{--                            <option value="104">com.mbds.parcours.Illustration : 104</option>--}%
                        %{--                            <option value="105">com.mbds.parcours.Illustration : 105</option>--}%
                        %{--                            <option value="106">com.mbds.parcours.Illustration : 106</option>--}%
                        %{--                            <option value="107">com.mbds.parcours.Illustration : 107</option>--}%
                        %{--                            <option value="108">com.mbds.parcours.Illustration : 108</option>--}%
                        %{--                            <option value="109">com.mbds.parcours.Illustration : 109</option>--}%
                        %{--                            <option value="110">com.mbds.parcours.Illustration : 110</option>--}%
                        %{--                            <option value="111">com.mbds.parcours.Illustration : 111</option>--}%
                        %{--                            <option value="112">com.mbds.parcours.Illustration : 112</option>--}%
                        %{--                            <option value="113">com.mbds.parcours.Illustration : 113</option>--}%
                        %{--                            <option value="114">com.mbds.parcours.Illustration : 114</option>--}%
                        %{--                            <option value="115">com.mbds.parcours.Illustration : 115</option>--}%
                        %{--                            <option value="116">com.mbds.parcours.Illustration : 116</option>--}%
                        %{--                            <option value="117">com.mbds.parcours.Illustration : 117</option>--}%
                        %{--                            <option value="118">com.mbds.parcours.Illustration : 118</option>--}%
                        %{--                            <option value="119">com.mbds.parcours.Illustration : 119</option>--}%
                        %{--                            <option value="120">com.mbds.parcours.Illustration : 120</option>--}%
                        %{--                            <option value="121">com.mbds.parcours.Illustration : 121</option>--}%
                        %{--                            <option value="122">com.mbds.parcours.Illustration : 122</option>--}%
                        %{--                            <option value="123">com.mbds.parcours.Illustration : 123</option>--}%
                        %{--                            <option value="124">com.mbds.parcours.Illustration : 124</option>--}%
                        %{--                            <option value="125">com.mbds.parcours.Illustration : 125</option>--}%
                        %{--                            <option value="126">com.mbds.parcours.Illustration : 126</option>--}%
                        %{--                            <option value="127">com.mbds.parcours.Illustration : 127</option>--}%
                        %{--                            <option value="128">com.mbds.parcours.Illustration : 128</option>--}%
                        %{--                            <option value="129">com.mbds.parcours.Illustration : 129</option>--}%
                        %{--                            <option value="130">com.mbds.parcours.Illustration : 130</option>--}%
                        %{--                            <option value="131">com.mbds.parcours.Illustration : 131</option>--}%
                        %{--                            <option value="132">com.mbds.parcours.Illustration : 132</option>--}%
                        %{--                            <option value="133">com.mbds.parcours.Illustration : 133</option>--}%
                        %{--                            <option value="134">com.mbds.parcours.Illustration : 134</option>--}%
                        %{--                            <option value="135">com.mbds.parcours.Illustration : 135</option>--}%
                        %{--                            <option value="136">com.mbds.parcours.Illustration : 136</option>--}%
                        %{--                            <option value="137">com.mbds.parcours.Illustration : 137</option>--}%
                        %{--                            <option value="138">com.mbds.parcours.Illustration : 138</option>--}%
                        %{--                            <option value="139">com.mbds.parcours.Illustration : 139</option>--}%
                        %{--                            <option value="140">com.mbds.parcours.Illustration : 140</option>--}%
                        %{--                            <option value="141">com.mbds.parcours.Illustration : 141</option>--}%
                        %{--                            <option value="142">com.mbds.parcours.Illustration : 142</option>--}%
                        %{--                            <option value="143">com.mbds.parcours.Illustration : 143</option>--}%
                        %{--                            <option value="144">com.mbds.parcours.Illustration : 144</option>--}%
                        %{--                            <option value="145">com.mbds.parcours.Illustration : 145</option>--}%
                        %{--                            <option value="146">com.mbds.parcours.Illustration : 146</option>--}%
                        %{--                            <option value="147">com.mbds.parcours.Illustration : 147</option>--}%
                        %{--                            <option value="148">com.mbds.parcours.Illustration : 148</option>--}%
                        %{--                            <option value="149">com.mbds.parcours.Illustration : 149</option>--}%
                        %{--                            <option value="150">com.mbds.parcours.Illustration : 150</option>--}%
                        %{--                            <option value="151">com.mbds.parcours.Illustration : 151</option>--}%
                        %{--                            <option value="152">com.mbds.parcours.Illustration : 152</option>--}%
                        %{--                            <option value="153">com.mbds.parcours.Illustration : 153</option>--}%
                        %{--                            <option value="154">com.mbds.parcours.Illustration : 154</option>--}%
                        %{--                            <option value="155">com.mbds.parcours.Illustration : 155</option>--}%
                        %{--                            <option value="156">com.mbds.parcours.Illustration : 156</option>--}%
                        %{--                            <option value="157">com.mbds.parcours.Illustration : 157</option>--}%
                        %{--                            <option value="158">com.mbds.parcours.Illustration : 158</option>--}%
                        %{--                            <option value="159">com.mbds.parcours.Illustration : 159</option>--}%
                        %{--                            <option value="160">com.mbds.parcours.Illustration : 160</option>--}%
                        %{--                            <option value="161">com.mbds.parcours.Illustration : 161</option>--}%
                        %{--                            <option value="162">com.mbds.parcours.Illustration : 162</option>--}%
                        %{--                            <option value="163">com.mbds.parcours.Illustration : 163</option>--}%
                        %{--                            <option value="164">com.mbds.parcours.Illustration : 164</option>--}%
                        %{--                            <option value="165">com.mbds.parcours.Illustration : 165</option>--}%
                        %{--                            <option value="166">com.mbds.parcours.Illustration : 166</option>--}%
                        %{--                            <option value="167">com.mbds.parcours.Illustration : 167</option>--}%
                        %{--                            <option value="168">com.mbds.parcours.Illustration : 168</option>--}%
                        %{--                            <option value="169">com.mbds.parcours.Illustration : 169</option>--}%
                        %{--                            <option value="170">com.mbds.parcours.Illustration : 170</option>--}%
                        %{--                            <option value="171">com.mbds.parcours.Illustration : 171</option>--}%
                        %{--                            <option value="172">com.mbds.parcours.Illustration : 172</option>--}%
                        %{--                            <option value="173">com.mbds.parcours.Illustration : 173</option>--}%
                        %{--                            <option value="174">com.mbds.parcours.Illustration : 174</option>--}%
                        %{--                            <option value="175">com.mbds.parcours.Illustration : 175</option>--}%
                        %{--                            <option value="176">com.mbds.parcours.Illustration : 176</option>--}%
                        %{--                            <option value="177">com.mbds.parcours.Illustration : 177</option>--}%
                        %{--                            <option value="178">com.mbds.parcours.Illustration : 178</option>--}%
                        %{--                            <option value="179">com.mbds.parcours.Illustration : 179</option>--}%
                        %{--                            <option value="180">com.mbds.parcours.Illustration : 180</option>--}%
                        %{--                            <option value="181">com.mbds.parcours.Illustration : 181</option>--}%
                        %{--                            <option value="182">com.mbds.parcours.Illustration : 182</option>--}%
                        %{--                            <option value="183">com.mbds.parcours.Illustration : 183</option>--}%
                        %{--                            <option value="184">com.mbds.parcours.Illustration : 184</option>--}%
                        %{--                            <option value="185">com.mbds.parcours.Illustration : 185</option>--}%
                        %{--                            <option value="186">com.mbds.parcours.Illustration : 186</option>--}%
                        %{--                            <option value="187">com.mbds.parcours.Illustration : 187</option>--}%
                        %{--                            <option value="188">com.mbds.parcours.Illustration : 188</option>--}%
                        %{--                            <option value="189">com.mbds.parcours.Illustration : 189</option>--}%
                        %{--                            <option value="190">com.mbds.parcours.Illustration : 190</option>--}%
                        %{--                            <option value="191">com.mbds.parcours.Illustration : 191</option>--}%
                        %{--                            <option value="192">com.mbds.parcours.Illustration : 192</option>--}%
                        %{--                            <option value="193">com.mbds.parcours.Illustration : 193</option>--}%
                        %{--                            <option value="194">com.mbds.parcours.Illustration : 194</option>--}%
                        %{--                            <option value="195">com.mbds.parcours.Illustration : 195</option>--}%
                        %{--                            <option value="196">com.mbds.parcours.Illustration : 196</option>--}%
                        %{--                            <option value="197">com.mbds.parcours.Illustration : 197</option>--}%
                        %{--                            <option value="198">com.mbds.parcours.Illustration : 198</option>--}%
                        %{--                            <option value="199">com.mbds.parcours.Illustration : 199</option>--}%
                        %{--                            <option value="200">com.mbds.parcours.Illustration : 200</option>--}%
                        %{--                            <option value="201">com.mbds.parcours.Illustration : 201</option>--}%
                        %{--                            <option value="202">com.mbds.parcours.Illustration : 202</option>--}%
                        %{--                            <option value="203">com.mbds.parcours.Illustration : 203</option>--}%
                        %{--                            <option value="204">com.mbds.parcours.Illustration : 204</option>--}%
                        %{--                            <option value="205">com.mbds.parcours.Illustration : 205</option>--}%
                        %{--                            <option value="206">com.mbds.parcours.Illustration : 206</option>--}%
                        %{--                            <option value="207">com.mbds.parcours.Illustration : 207</option>--}%
                        %{--                            <option value="208">com.mbds.parcours.Illustration : 208</option>--}%
                        %{--                            <option value="209">com.mbds.parcours.Illustration : 209</option>--}%
                        %{--                            <option value="210">com.mbds.parcours.Illustration : 210</option>--}%
                        %{--                            <option value="211">com.mbds.parcours.Illustration : 211</option>--}%
                        %{--                            <option value="212">com.mbds.parcours.Illustration : 212</option>--}%
                        %{--                            <option value="213">com.mbds.parcours.Illustration : 213</option>--}%
                        %{--                            <option value="214">com.mbds.parcours.Illustration : 214</option>--}%
                        %{--                            <option value="215">com.mbds.parcours.Illustration : 215</option>--}%
                        %{--                            <option value="216">com.mbds.parcours.Illustration : 216</option>--}%
                        %{--                            <option value="217">com.mbds.parcours.Illustration : 217</option>--}%
                        %{--                            <option value="218">com.mbds.parcours.Illustration : 218</option>--}%
                        %{--                            <option value="219">com.mbds.parcours.Illustration : 219</option>--}%
                        %{--                            <option value="220">com.mbds.parcours.Illustration : 220</option>--}%
                        %{--                            <option value="221">com.mbds.parcours.Illustration : 221</option>--}%
                        %{--                            <option value="222">com.mbds.parcours.Illustration : 222</option>--}%
                        %{--                            <option value="223">com.mbds.parcours.Illustration : 223</option>--}%
                        %{--                            <option value="224">com.mbds.parcours.Illustration : 224</option>--}%
                        %{--                            <option value="225">com.mbds.parcours.Illustration : 225</option>--}%
                        %{--                            <option value="226">com.mbds.parcours.Illustration : 226</option>--}%
                        %{--                            <option value="227">com.mbds.parcours.Illustration : 227</option>--}%
                        %{--                            <option value="228">com.mbds.parcours.Illustration : 228</option>--}%
                        %{--                            <option value="229">com.mbds.parcours.Illustration : 229</option>--}%
                        %{--                            <option value="230">com.mbds.parcours.Illustration : 230</option>--}%
                        %{--                            <option value="231">com.mbds.parcours.Illustration : 231</option>--}%
                        %{--                            <option value="232">com.mbds.parcours.Illustration : 232</option>--}%
                        %{--                            <option value="233">com.mbds.parcours.Illustration : 233</option>--}%
                        %{--                            <option value="234">com.mbds.parcours.Illustration : 234</option>--}%
                        %{--                            <option value="235">com.mbds.parcours.Illustration : 235</option>--}%
                        %{--                            <option value="236">com.mbds.parcours.Illustration : 236</option>--}%
                        %{--                            <option value="237">com.mbds.parcours.Illustration : 237</option>--}%
                        %{--                            <option value="238">com.mbds.parcours.Illustration : 238</option>--}%
                        %{--                            <option value="239">com.mbds.parcours.Illustration : 239</option>--}%
                        %{--                            <option value="240">com.mbds.parcours.Illustration : 240</option>--}%
                        %{--                            <option value="241">com.mbds.parcours.Illustration : 241</option>--}%
                        %{--                            <option value="242">com.mbds.parcours.Illustration : 242</option>--}%
                        %{--                            <option value="243">com.mbds.parcours.Illustration : 243</option>--}%
                        %{--                            <option value="244">com.mbds.parcours.Illustration : 244</option>--}%
                        %{--                            <option value="245">com.mbds.parcours.Illustration : 245</option>--}%
                        %{--                            <option value="246">com.mbds.parcours.Illustration : 246</option>--}%
                        %{--                            <option value="247">com.mbds.parcours.Illustration : 247</option>--}%
                        %{--                            <option value="248">com.mbds.parcours.Illustration : 248</option>--}%
                        %{--                            <option value="249">com.mbds.parcours.Illustration : 249</option>--}%
                        %{--                            <option value="250">com.mbds.parcours.Illustration : 250</option>--}%
                        %{--                            <option value="251">com.mbds.parcours.Illustration : 251</option>--}%
                        %{--                            <option value="252">com.mbds.parcours.Illustration : 252</option>--}%
                        %{--                            <option value="253">com.mbds.parcours.Illustration : 253</option>--}%
                        %{--                            <option value="254">com.mbds.parcours.Illustration : 254</option>--}%
                        %{--                            <option value="255">com.mbds.parcours.Illustration : 255</option>--}%
                        %{--                            <option value="256">com.mbds.parcours.Illustration : 256</option>--}%
                        %{--                            <option value="257">com.mbds.parcours.Illustration : 257</option>--}%
                        %{--                            <option value="258">com.mbds.parcours.Illustration : 258</option>--}%
                        %{--                            <option value="259">com.mbds.parcours.Illustration : 259</option>--}%
                        %{--                            <option value="260">com.mbds.parcours.Illustration : 260</option>--}%
                        %{--                            <option value="261">com.mbds.parcours.Illustration : 261</option>--}%
                        %{--                            <option value="262">com.mbds.parcours.Illustration : 262</option>--}%
                        %{--                            <option value="263">com.mbds.parcours.Illustration : 263</option>--}%
                        %{--                            <option value="264">com.mbds.parcours.Illustration : 264</option>--}%
                        %{--                            <option value="265">com.mbds.parcours.Illustration : 265</option>--}%
                        %{--                            <option value="266">com.mbds.parcours.Illustration : 266</option>--}%
                        %{--                            <option value="267">com.mbds.parcours.Illustration : 267</option>--}%
                        %{--                            <option value="268">com.mbds.parcours.Illustration : 268</option>--}%
                        %{--                            <option value="269">com.mbds.parcours.Illustration : 269</option>--}%
                        %{--                            <option value="270">com.mbds.parcours.Illustration : 270</option>--}%
                        %{--                            <option value="271">com.mbds.parcours.Illustration : 271</option>--}%
                        %{--                            <option value="272">com.mbds.parcours.Illustration : 272</option>--}%
                        %{--                            <option value="273">com.mbds.parcours.Illustration : 273</option>--}%
                        %{--                            <option value="274">com.mbds.parcours.Illustration : 274</option>--}%
                        %{--                            <option value="275">com.mbds.parcours.Illustration : 275</option>--}%
                        %{--                            <option value="276">com.mbds.parcours.Illustration : 276</option>--}%
                        %{--                            <option value="277">com.mbds.parcours.Illustration : 277</option>--}%
                        %{--                            <option value="278">com.mbds.parcours.Illustration : 278</option>--}%
                        %{--                            <option value="279">com.mbds.parcours.Illustration : 279</option>--}%
                        %{--                            <option value="280">com.mbds.parcours.Illustration : 280</option>--}%
                        %{--                            <option value="281">com.mbds.parcours.Illustration : 281</option>--}%
                        %{--                            <option value="282">com.mbds.parcours.Illustration : 282</option>--}%
                        %{--                            <option value="283">com.mbds.parcours.Illustration : 283</option>--}%
                        %{--                            <option value="284">com.mbds.parcours.Illustration : 284</option>--}%
                        %{--                            <option value="285">com.mbds.parcours.Illustration : 285</option>--}%
                        %{--                            <option value="286">com.mbds.parcours.Illustration : 286</option>--}%
                        %{--                            <option value="287">com.mbds.parcours.Illustration : 287</option>--}%
                        %{--                            <option value="288">com.mbds.parcours.Illustration : 288</option>--}%
                        %{--                            <option value="289">com.mbds.parcours.Illustration : 289</option>--}%
                        %{--                            <option value="290">com.mbds.parcours.Illustration : 290</option>--}%
                        %{--                            <option value="291">com.mbds.parcours.Illustration : 291</option>--}%
                        %{--                            <option value="292">com.mbds.parcours.Illustration : 292</option>--}%
                        %{--                            <option value="293">com.mbds.parcours.Illustration : 293</option>--}%
                        %{--                            <option value="294">com.mbds.parcours.Illustration : 294</option>--}%
                        %{--                            <option value="295">com.mbds.parcours.Illustration : 295</option>--}%
                        %{--                            <option value="296">com.mbds.parcours.Illustration : 296</option>--}%
                        %{--                            <option value="297">com.mbds.parcours.Illustration : 297</option>--}%
                        %{--                            <option value="298">com.mbds.parcours.Illustration : 298</option>--}%
                        %{--                            <option value="299">com.mbds.parcours.Illustration : 299</option>--}%
                        %{--                            <option value="300">com.mbds.parcours.Illustration : 300</option>--}%
                        %{--                            <option value="301">com.mbds.parcours.Illustration : 301</option>--}%
                        %{--                            <option value="302">com.mbds.parcours.Illustration : 302</option>--}%
                        %{--                            <option value="303">com.mbds.parcours.Illustration : 303</option>--}%
                        %{--                            <option value="304">com.mbds.parcours.Illustration : 304</option>--}%
                        %{--                            <option value="305">com.mbds.parcours.Illustration : 305</option>--}%
                        %{--                            <option value="306">com.mbds.parcours.Illustration : 306</option>--}%
                        %{--                            <option value="307">com.mbds.parcours.Illustration : 307</option>--}%
                        %{--                            <option value="308">com.mbds.parcours.Illustration : 308</option>--}%
                        %{--                            <option value="309">com.mbds.parcours.Illustration : 309</option>--}%
                        %{--                            <option value="310">com.mbds.parcours.Illustration : 310</option>--}%
                        %{--                            <option value="311">com.mbds.parcours.Illustration : 311</option>--}%
                        %{--                            <option value="312">com.mbds.parcours.Illustration : 312</option>--}%
                        %{--                            <option value="313">com.mbds.parcours.Illustration : 313</option>--}%
                        %{--                            <option value="314">com.mbds.parcours.Illustration : 314</option>--}%
                        %{--                            <option value="315">com.mbds.parcours.Illustration : 315</option>--}%
                        %{--                            <option value="316">com.mbds.parcours.Illustration : 316</option>--}%
                        %{--                            <option value="317">com.mbds.parcours.Illustration : 317</option>--}%
                        %{--                            <option value="318">com.mbds.parcours.Illustration : 318</option>--}%
                        %{--                            <option value="319">com.mbds.parcours.Illustration : 319</option>--}%
                        %{--                            <option value="320">com.mbds.parcours.Illustration : 320</option>--}%
                        %{--                            <option value="321">com.mbds.parcours.Illustration : 321</option>--}%
                        %{--                            <option value="322">com.mbds.parcours.Illustration : 322</option>--}%
                        %{--                            <option value="323">com.mbds.parcours.Illustration : 323</option>--}%
                        %{--                            <option value="324">com.mbds.parcours.Illustration : 324</option>--}%
                        %{--                            <option value="325">com.mbds.parcours.Illustration : 325</option>--}%
                        %{--                            <option value="326">com.mbds.parcours.Illustration : 326</option>--}%
                        %{--                            <option value="327">com.mbds.parcours.Illustration : 327</option>--}%
                        %{--                            <option value="328">com.mbds.parcours.Illustration : 328</option>--}%
                        %{--                            <option value="329">com.mbds.parcours.Illustration : 329</option>--}%
                        %{--                            <option value="330">com.mbds.parcours.Illustration : 330</option>--}%
                        %{--                            <option value="331">com.mbds.parcours.Illustration : 331</option>--}%
                        %{--                            <option value="332">com.mbds.parcours.Illustration : 332</option>--}%
                        %{--                            <option value="333">com.mbds.parcours.Illustration : 333</option>--}%
                        %{--                            <option value="334">com.mbds.parcours.Illustration : 334</option>--}%
                        %{--                            <option value="335">com.mbds.parcours.Illustration : 335</option>--}%
                        %{--                            <option value="336">com.mbds.parcours.Illustration : 336</option>--}%
                        %{--                            <option value="337">com.mbds.parcours.Illustration : 337</option>--}%
                        %{--                            <option value="338">com.mbds.parcours.Illustration : 338</option>--}%
                        %{--                            <option value="339">com.mbds.parcours.Illustration : 339</option>--}%
                        %{--                            <option value="340">com.mbds.parcours.Illustration : 340</option>--}%
                        %{--                            <option value="341">com.mbds.parcours.Illustration : 341</option>--}%
                        %{--                            <option value="342">com.mbds.parcours.Illustration : 342</option>--}%
                        %{--                            <option value="343">com.mbds.parcours.Illustration : 343</option>--}%
                        %{--                            <option value="344">com.mbds.parcours.Illustration : 344</option>--}%
                        %{--                            <option value="345">com.mbds.parcours.Illustration : 345</option>--}%
                        %{--                            <option value="346">com.mbds.parcours.Illustration : 346</option>--}%
                        %{--                            <option value="347">com.mbds.parcours.Illustration : 347</option>--}%
                        %{--                            <option value="348">com.mbds.parcours.Illustration : 348</option>--}%
                        %{--                            <option value="349">com.mbds.parcours.Illustration : 349</option>--}%
                        %{--                            <option value="350">com.mbds.parcours.Illustration : 350</option>--}%
                        %{--                            <option value="351">com.mbds.parcours.Illustration : 351</option>--}%
                        %{--                            <option value="352">com.mbds.parcours.Illustration : 352</option>--}%
                        %{--                            <option value="353">com.mbds.parcours.Illustration : 353</option>--}%
                        %{--                            <option value="354">com.mbds.parcours.Illustration : 354</option>--}%
                        %{--                            <option value="355">com.mbds.parcours.Illustration : 355</option>--}%
                        %{--                            <option value="356">com.mbds.parcours.Illustration : 356</option>--}%
                        %{--                            <option value="357">com.mbds.parcours.Illustration : 357</option>--}%
                        %{--                            <option value="358">com.mbds.parcours.Illustration : 358</option>--}%
                        %{--                            <option value="359">com.mbds.parcours.Illustration : 359</option>--}%
                        %{--                            <option value="360">com.mbds.parcours.Illustration : 360</option>--}%
                        %{--                            <option value="361">com.mbds.parcours.Illustration : 361</option>--}%
                        %{--                            <option value="362">com.mbds.parcours.Illustration : 362</option>--}%
                        %{--                            <option value="363">com.mbds.parcours.Illustration : 363</option>--}%
                        %{--                            <option value="364">com.mbds.parcours.Illustration : 364</option>--}%
                        %{--                            <option value="365">com.mbds.parcours.Illustration : 365</option>--}%
                        %{--                            <option value="366">com.mbds.parcours.Illustration : 366</option>--}%
                        %{--                            <option value="367">com.mbds.parcours.Illustration : 367</option>--}%
                        %{--                            <option value="368">com.mbds.parcours.Illustration : 368</option>--}%
                        %{--                            <option value="369">com.mbds.parcours.Illustration : 369</option>--}%
                        %{--                            <option value="370">com.mbds.parcours.Illustration : 370</option>--}%
                        %{--                            <option value="371">com.mbds.parcours.Illustration : 371</option>--}%
                        %{--                            <option value="372">com.mbds.parcours.Illustration : 372</option>--}%
                        %{--                            <option value="373">com.mbds.parcours.Illustration : 373</option>--}%
                        %{--                            <option value="374">com.mbds.parcours.Illustration : 374</option>--}%
                        %{--                            <option value="375">com.mbds.parcours.Illustration : 375</option>--}%
                        %{--                            <option value="376">com.mbds.parcours.Illustration : 376</option>--}%
                        %{--                            <option value="377">com.mbds.parcours.Illustration : 377</option>--}%
                        %{--                            <option value="378">com.mbds.parcours.Illustration : 378</option>--}%
                        %{--                            <option value="379">com.mbds.parcours.Illustration : 379</option>--}%
                        %{--                            <option value="380">com.mbds.parcours.Illustration : 380</option>--}%
                        %{--                            <option value="381">com.mbds.parcours.Illustration : 381</option>--}%
                        %{--                            <option value="382">com.mbds.parcours.Illustration : 382</option>--}%
                        %{--                            <option value="383">com.mbds.parcours.Illustration : 383</option>--}%
                        %{--                            <option value="384">com.mbds.parcours.Illustration : 384</option>--}%
                        %{--                            <option value="385">com.mbds.parcours.Illustration : 385</option>--}%
                        %{--                            <option value="386">com.mbds.parcours.Illustration : 386</option>--}%
                        %{--                            <option value="387">com.mbds.parcours.Illustration : 387</option>--}%
                        %{--                            <option value="388">com.mbds.parcours.Illustration : 388</option>--}%
                        %{--                            <option value="389">com.mbds.parcours.Illustration : 389</option>--}%
                        %{--                            <option value="390">com.mbds.parcours.Illustration : 390</option>--}%
                        %{--                            <option value="391">com.mbds.parcours.Illustration : 391</option>--}%
                        %{--                            <option value="392">com.mbds.parcours.Illustration : 392</option>--}%
                        %{--                            <option value="393">com.mbds.parcours.Illustration : 393</option>--}%
                        %{--                            <option value="394">com.mbds.parcours.Illustration : 394</option>--}%
                        %{--                            <option value="395">com.mbds.parcours.Illustration : 395</option>--}%
                        %{--                            <option value="396">com.mbds.parcours.Illustration : 396</option>--}%
                        %{--                            <option value="397">com.mbds.parcours.Illustration : 397</option>--}%
                        %{--                            <option value="398">com.mbds.parcours.Illustration : 398</option>--}%
                        %{--                            <option value="399">com.mbds.parcours.Illustration : 399</option>--}%
                        %{--                            <option value="400">com.mbds.parcours.Illustration : 400</option>--}%
                        %{--                            <option value="401">com.mbds.parcours.Illustration : 401</option>--}%
                        %{--                            <option value="402">com.mbds.parcours.Illustration : 402</option>--}%
                        %{--                            <option value="403">com.mbds.parcours.Illustration : 403</option>--}%
                        %{--                            <option value="404">com.mbds.parcours.Illustration : 404</option>--}%
                        %{--                            <option value="405">com.mbds.parcours.Illustration : 405</option>--}%
                        %{--                            <option value="406">com.mbds.parcours.Illustration : 406</option>--}%
                        %{--                            <option value="407">com.mbds.parcours.Illustration : 407</option>--}%
                        %{--                            <option value="408">com.mbds.parcours.Illustration : 408</option>--}%
                        %{--                            <option value="409">com.mbds.parcours.Illustration : 409</option>--}%
                        %{--                            <option value="410">com.mbds.parcours.Illustration : 410</option>--}%
                        %{--                            <option value="411">com.mbds.parcours.Illustration : 411</option>--}%
                        %{--                            <option value="412">com.mbds.parcours.Illustration : 412</option>--}%
                        %{--                            <option value="413">com.mbds.parcours.Illustration : 413</option>--}%
                        %{--                            <option value="414">com.mbds.parcours.Illustration : 414</option>--}%
                        %{--                            <option value="415">com.mbds.parcours.Illustration : 415</option>--}%
                        %{--                            <option value="416">com.mbds.parcours.Illustration : 416</option>--}%
                        %{--                            <option value="417">com.mbds.parcours.Illustration : 417</option>--}%
                        %{--                            <option value="418">com.mbds.parcours.Illustration : 418</option>--}%
                        %{--                            <option value="419">com.mbds.parcours.Illustration : 419</option>--}%
                        %{--                            <option value="420">com.mbds.parcours.Illustration : 420</option>--}%
                        %{--                            <option value="421">com.mbds.parcours.Illustration : 421</option>--}%
                        %{--                            <option value="422">com.mbds.parcours.Illustration : 422</option>--}%
                        %{--                            <option value="423">com.mbds.parcours.Illustration : 423</option>--}%
                        %{--                            <option value="424">com.mbds.parcours.Illustration : 424</option>--}%
                        %{--                            <option value="425">com.mbds.parcours.Illustration : 425</option>--}%
                        %{--                        </select>--}%
                    </div>

                    <div class="fieldcontain">
                        <label for="parcoursList">Parcours List</label><ul></ul><a
                            href="/parcours/create?user.id=">Add Parcours</a>
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <input type="submit" name="create" class="save" value="Create" id="create">
                </fieldset>
            </form>
        </fieldset>
    %{--        <fieldset class="buttons">--}%
    %{--            <g:submitButton name="create" class="save"--}%
    %{--                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>--}%
    %{--        </fieldset>--}%
    </g:form>
</div>
</body>
</html>
